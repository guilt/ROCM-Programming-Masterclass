#include <stdio.h>
#include <stdlib.h>

#include <common.h>

#include <hip/hip_runtime.h>
#include <hipCommon.hiph>

//Reduction with Neighborhood and Thread Sync
__global__ void reductionNeighborhoodThreadSync(int * input, int * temp, int size)
{
	int tid = threadIdx.x;
	int gid = blockDim.x * blockIdx.x + threadIdx.x;

	if (gid > size)
		return;

	for (int offset = blockDim.x/2; offset > 0; offset >>= 1)
	{
		if (tid < offset)
		{
			input[gid] += input[gid + offset];
		}

		__syncthreads();
	}

	if (tid == 0)
	{
		temp[blockIdx.x] = input[gid];
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
	reductionNeighborhoodThreadSync <<< grid, block >>> (deviceInput, deviceTemp, size);

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
