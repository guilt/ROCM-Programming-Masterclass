#include <stdio.h>
#include <stdlib.h>

#include <common.h>

#include <hip/hip_runtime.h>
#include <hipCommon.hiph>

//Reduction with Complete Unrolling Template
template<unsigned int inputBlockSize> __global__ void reductionUnrollingTemplate (int * input, int * temp, int size) {
	int threadId = threadIdx.x;
	int blockOffset = blockDim.x * blockIdx.x * 8;
	int uniqueIndex = blockOffset + threadIdx.x;
	int * inputBlock = input + blockOffset;
	
	assert(blockDim.x <= 4096);

	if ((uniqueIndex + 7 * blockDim.x) < size)
	{
		int a1 = input[uniqueIndex];
		int a2 = input[uniqueIndex + blockDim.x];
		int a3 = input[uniqueIndex + 2 * blockDim.x];
		int a4 = input[uniqueIndex + 3 * blockDim.x];
		int a5 = input[uniqueIndex + 4 * blockDim.x];
		int a6 = input[uniqueIndex + 5 * blockDim.x];
		int a7 = input[uniqueIndex + 6 * blockDim.x];
		int a8 = input[uniqueIndex + 7 * blockDim.x];

		input[uniqueIndex] = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8;
	}

	__syncthreads();

	if (inputBlockSize == 4096 && threadId < 2048)
		inputBlock[threadId] += inputBlock[threadId + 2048];
	__syncthreads();

	if (inputBlockSize >= 2048 && threadId < 1024)
		inputBlock[threadId] += inputBlock[threadId + 1024];
	__syncthreads();

	if (inputBlockSize >= 1024 && threadId < 512)
		inputBlock[threadId] += inputBlock[threadId + 512];

	__syncthreads();

	if (inputBlockSize >= 512 && threadId < 256)
		inputBlock[threadId] += inputBlock[threadId + 256];

	__syncthreads();

	if (inputBlockSize >= 256 && threadId < 128)
		inputBlock[threadId] += inputBlock[threadId + 128];

	__syncthreads();

	if (inputBlockSize >= 128 && threadId < 64)
		inputBlock[threadId] += inputBlock[threadId + 64];

	__syncthreads();

	//unrolling warp
	if (threadId < 32)
	{
		volatile int * volSharedMem = inputBlock;
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

	switch (blockSize)
	{
	case 1024 :
		reductionUnrollingTemplate <1024> <<< grid, block >>> (deviceInput, deviceTemp, size);
		break;
	case 512:
		reductionUnrollingTemplate <512> <<< grid, block >>> (deviceInput, deviceTemp, size);
		break;
	case 256:
		reductionUnrollingTemplate <256> <<< grid, block >>> (deviceInput, deviceTemp, size);
		break;
	case 128:
		reductionUnrollingTemplate <128> <<< grid, block >>> (deviceInput, deviceTemp, size);
		break;
	case 64:
		reductionUnrollingTemplate <64> <<< grid, block >>> (deviceInput, deviceTemp, size);
		break;
	default:
		cpuErrorCheck(blockSize >= 64, "Blocksize is too small.");
	}

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
