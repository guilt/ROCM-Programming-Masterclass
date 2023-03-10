#include <stdio.h>
#include <stdlib.h>

#include <common.h>

#include <hip/hip_runtime.h>
#include <hipCommon.hiph>

//Unroll Factor
const int unrollFactor = 8;

//Reduction with Loop Unrolling 8 Way
__global__ void reductionNeighborhoodUnrollingBlocks8Way(int * input, int * temp, int size)
{
	int threadId = threadIdx.x;
	int blockOffset = blockIdx.x * blockDim.x * unrollFactor;
	int *inputBlock = input + blockOffset;
	int uniqueIndex = blockOffset + threadId;

	if ((uniqueIndex + ((unrollFactor -1)*blockDim.x)) < size)
	{
		input[uniqueIndex] +=
		input[uniqueIndex + blockDim.x*1] +
		input[uniqueIndex + blockDim.x*2] +
		input[uniqueIndex + blockDim.x*3] +
		input[uniqueIndex + blockDim.x*4] +
		input[uniqueIndex + blockDim.x*5] +
		input[uniqueIndex + blockDim.x*6] +
		input[uniqueIndex + blockDim.x*7];
	}

	__syncthreads();

	for (int offset = blockDim.x / 2; offset > 0; offset = offset / 2)
	{
		if (threadId < offset)
		{
			inputBlock[threadId] += inputBlock[threadId + offset];
		}

		__syncthreads();
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
	int blockSize = 256;

	int *hostInput, *hostTemp;
	HANDLE_NULL(hostInput = (int*)malloc(byteSize));

	initializeArray(hostInput, size, INIT_RANDOM);

	int cpuResult = reductionArrayCpu(hostInput, size);

	dim3 block(blockSize);
	dim3 grid((size/block.x)/unrollFactor);

	int tempArrayByteSize = sizeof(int) * grid.x;
	HANDLE_NULL(hostTemp = (int*)malloc(tempArrayByteSize));

	int *deviceInput, *deviceTemp;

	gpuErrorCheck(hipMalloc((void**)&deviceInput,byteSize));
	gpuErrorCheck(hipMalloc((void**)&deviceTemp, tempArrayByteSize));
	gpuErrorCheck(hipMemset(deviceTemp, 0, tempArrayByteSize));
	gpuErrorCheck(hipMemcpy(deviceInput, hostInput, byteSize, hipMemcpyHostToDevice));
	reductionNeighborhoodUnrollingBlocks8Way <<< grid, block >>> (deviceInput, deviceTemp, size);

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
