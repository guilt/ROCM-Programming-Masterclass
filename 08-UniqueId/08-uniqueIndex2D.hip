#include <stdio.h>
#include <stdlib.h>

#include <hip/hip_runtime.h>

__global__ void uniqueIndexCalcGridThreadIdx(int * input)
{
	int numThreadsInABlock = blockDim.x * blockDim.y;

	int uniqBlockId = (gridDim.x * blockIdx.y) +
	                  blockIdx.x;

	int uniqThreadId = (blockDim.x * threadIdx.y)
	                   + threadIdx.x;

	int uniqId = (numThreadsInABlock * uniqBlockId) + uniqThreadId;

	printf("blockIdx.x : %d, blockIdx.y : %d, "
	       "threadIdx.x : %d, threadIdx.y : %d, "
	       "uniqId : %d, value : %d \n",
		(int)blockIdx.x, (int)blockIdx.y,
		(int)threadIdx.x, (int)threadIdx.y,
		uniqId, input[uniqId]);
}

int main()
{
	int arraySize = 16;
        int arrayByteSize = sizeof(int) * arraySize;
	int hostData[] = {23,9,4,53,65,12,1,33,87,45,23,12,342,56,44,99};

	printf("Array: \n");
	for (int i = 0; i < arraySize; i++)
	{
		printf("%d ", hostData[i]);
	}
	printf("\n");

	int * deviceData;
	hipMalloc((void**)&deviceData, arrayByteSize);
	hipMemcpy(deviceData, hostData, arrayByteSize, hipMemcpyHostToDevice);

	dim3 block(2,2);
	dim3 grid(2,2);
	
	uniqueIndexCalcGridThreadIdx <<< grid, block >>> (deviceData);
	hipDeviceSynchronize();

	hipDeviceReset();
	return 0;
}
