#include <stdio.h>
#include <stdlib.h>

#include <hip/hip_runtime.h>

__global__ void uniqueIndexCalcThreadIdx(int * input)
{
	int uniqThreadId = threadIdx.x;
	printf("threadIdx : %d, value : %d \n", uniqThreadId, input[uniqThreadId]);
}

__global__ void uniqueIndexCalcGridThreadIdx(int * input)
{
	int uniqThreadId = threadIdx.x;
	int offset = blockIdx.x * blockDim.x;
	int uniqId = uniqThreadId + offset;
	printf("blockIdx.x : %d, threadIdx.x : %d, uniqId : %d, value : %d \n",
		(int)blockIdx.x, uniqThreadId, uniqId, input[uniqId]);
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

	dim3 block(4);
	dim3 grid(4);
	
	uniqueIndexCalcGridThreadIdx <<< grid, block >>> (deviceData);
	hipDeviceSynchronize();

	hipDeviceReset();
	return 0;
}
