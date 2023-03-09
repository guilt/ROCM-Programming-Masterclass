#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <common.h>

#include <hip/hip_runtime.h>
#include <hipCommon.hiph>

//Reduction with Complete Unrolling
__global__ void reductionCompleteUnrolling(int *input, int *temp, int size)
{
	int threadId = threadIdx.x;
	int blockOffset = blockDim.x * blockIdx.x;
	int uniqueIndex = blockOffset + threadId;
	int *inputBlock = input + blockOffset;

	//element index for this thread
	int index = blockDim.x * blockIdx.x + threadIdx.x;

	assert(blockDim.x <= 4096);

	if (blockDim.x == 4096 && threadId < 2048)
		inputBlock[threadId] += inputBlock[threadId + 2048];
	__syncthreads();

	if (blockDim.x == 2048 && threadId < 1024)
		inputBlock[threadId] += inputBlock[threadId + 1024];
	__syncthreads();

	if (blockDim.x == 1024 && threadId < 512)
		inputBlock[threadId] += inputBlock[threadId + 512];
	__syncthreads();

	if (blockDim.x == 512 && threadId < 256)
		inputBlock[threadId] += inputBlock[threadId + 256];
	__syncthreads();

	if (blockDim.x == 256 && threadId < 128)
		inputBlock[threadId] += inputBlock[threadId + 128];
	__syncthreads();

	if (blockDim.x == 128 && threadId < 64)
		inputBlock[threadId] += inputBlock[threadId + 64];
	__syncthreads();

	if (threadId < 32)
	{
		volatile int *volSharedMem = inputBlock;
		volSharedMem[threadId] += volSharedMem[threadId + 32];
		volSharedMem[threadId] += volSharedMem[threadId + 16];
		volSharedMem[threadId] += volSharedMem[threadId + 8];
		volSharedMem[threadId] += volSharedMem[threadId + 4];
		volSharedMem[threadId] += volSharedMem[threadId + 2];
		volSharedMem[threadId] += volSharedMem[threadId + 1];
	}

	if (threadId == 0)
	{
		temp[blockIdx.x] = inputBlock[0];
	}
}


int main(int argc, char ** argv)
{

	int size = 1 << 27; //128 Mb of data
	int byteSize = size * sizeof(int);
	int blockSize = 128;

	int *hostInput, *hostTemp;
	HANDLE_NULL(hostInput = (int*)malloc(byteSize));

	initializeArray(hostInput, size, INIT_RANDOM);

	int cpuResult = reductionArrayCpu(hostInput, size);

	dim3 block(blockSize);
	dim3 grid(size/block.x);

	int tempArrayByteSize = sizeof(int) * grid.x;
	HANDLE_NULL(hostTemp = (int*)malloc(tempArrayByteSize));

	int *deviceInput, *deviceTemp;

	gpuErrorCheck(hipMalloc((void**)&deviceInput,byteSize));
	gpuErrorCheck(hipMalloc((void**)&deviceTemp, tempArrayByteSize));
	gpuErrorCheck(hipMemset(deviceTemp, 0, tempArrayByteSize));
	gpuErrorCheck(hipMemcpy(deviceInput, hostInput, byteSize, hipMemcpyHostToDevice));
	reductionCompleteUnrolling <<< grid, block >>> (deviceInput, deviceTemp, size);

	gpuErrorCheck(hipDeviceSynchronize());

	gpuErrorCheck(hipMemcpy(hostTemp, deviceTemp, tempArrayByteSize, hipMemcpyDeviceToHost));

	int gpuResult = 0;

	for (int i = 0; i < grid.x; i++)
	{
		gpuResult += hostTemp[i];
	}

	//validity check
	compareResults(gpuResult, cpuResult);

	gpuErrorCheck(hipFree(deviceTemp));
	gpuErrorCheck(hipFree(deviceInput));

	free(hostTemp);
	free(hostInput);

	gpuErrorCheck(hipDeviceReset());
	return 0;
}

