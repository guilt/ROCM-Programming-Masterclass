#include <stdio.h>
#include <stdlib.h>
#include <cstring>

#include <hip/hip_runtime.h>

__global__ void memoryTransferTest(int * input)
{
	int gid = blockIdx.x * blockDim.x + threadIdx.x;

	printf("tid : %d , gid : %d, value : %d \n", (int)threadIdx.x, gid, input[gid]);
}

__global__ void memoryTransferTestSized(int * input, int size)
{
	int gid = blockIdx.x * blockDim.x + threadIdx.x;

	if(gid < size)
		printf("tid : %d , gid : %d, value : %d \n", (int)threadIdx.x, gid, input[gid]);
}

int main()
{
	int size = 150;
	int byte_size = size * sizeof(int);

	int * hostData;
	hostData = (int*)malloc(byte_size);

	for (int i = 0; i < size; i++)
	{
		hostData[i] = i;
	}

	int * deviceData;
	hipMalloc((void**)&deviceData, byte_size);

	hipMemcpy(deviceData,hostData,byte_size,hipMemcpyHostToDevice);

	dim3 block(32);
	dim3 grid(5);

	memoryTransferTestSized <<<grid, block>>> (deviceData,size);
	hipDeviceSynchronize();

	hipFree(deviceData);
	free(hostData);

	hipDeviceReset();
	return 0;
}
