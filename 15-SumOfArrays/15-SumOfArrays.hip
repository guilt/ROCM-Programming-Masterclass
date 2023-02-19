#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <common.h>

#include <hip/hip_runtime.h>
#include <hipCommon.hiph>

#ifndef SIZE_SHIFT
#define SIZE_SHIFT 22
#endif //!SIZE_SHIFT

#ifndef BLOCK_SIZE
#define BLOCK_SIZE 1024
#endif //!BLOCK_SIZE

__global__ void sumArraysGpu(int * a, int * b, int * result, int arraySize)
{
	int index = blockDim.x * blockIdx.x + threadIdx.x;

	//if (index < arraySize) // use if not a multiple
	result[index] = a[index] + b[index];
}

int main()
{
	int size = 1 << SIZE_SHIFT;
	int blockSize = BLOCK_SIZE;
	hipError_t error;

	//number of bytes needed to hold element count
	size_t NO_BYTES = size * sizeof(int);

	// host pointers
	int *hostA, *hostB, *cpuResult, *gpuResult;

	//allocate memory for host size pointers
	hostA = (int *)malloc(NO_BYTES);
	hostB = (int *)malloc(NO_BYTES);
	cpuResult = (int *)malloc(NO_BYTES);
	gpuResult = (int *)malloc(NO_BYTES);

	//initialize hostA and hostB arrays randomly
	time_t t;
	srand((unsigned)time(&t));

	initializeArray(hostA, size, INIT_RANDOM, 0xFF);
	initializeArray(hostB, size, INIT_RANDOM, 0xFF);

	memset(gpuResult, 0, NO_BYTES);
	memset(cpuResult, 0, NO_BYTES);

	//summation in CPU
	clock_t cpuStart, cpuEnd;
	cpuStart = clock();
	sumArraysCpu(hostA, hostB, cpuResult, size);
	cpuEnd = clock();

	int *deviceA, *deviceB, *deviceResult;
	gpuErrorCheck(hipMalloc((int **)&deviceA, NO_BYTES));
	gpuErrorCheck(hipMalloc((int **)&deviceB, NO_BYTES));
	gpuErrorCheck(hipMalloc((int **)&deviceResult, NO_BYTES));

	//kernel launch parameters
	dim3 block(blockSize);
	dim3 grid((size + block.x - 1) / block.x);
	printf("Block Size: %d\n", block.x);
	printf("Grid Size: %d\n", grid.x);

	//memcpy time host to GPU
	clock_t memHostToDeviceStart, memHostToDeviceEnd;
	memHostToDeviceStart = clock();
	gpuErrorCheck(hipMemcpy(deviceA, hostA, NO_BYTES, hipMemcpyHostToDevice));
	gpuErrorCheck(hipMemcpy(deviceB, hostB, NO_BYTES, hipMemcpyHostToDevice));
	memHostToDeviceEnd = clock();

	//execution time measuring in GPU
	clock_t gpuStart, gpuEnd;
	gpuStart = clock();
	sumArraysGpu <<< grid, block >>> (deviceA, deviceB, deviceResult, size);
	gpuErrorCheck(hipDeviceSynchronize());
	gpuEnd = clock();

	//memcpy time GPU to host
	clock_t memDeviceToHostStart, memDeviceToHostEnd;
	memDeviceToHostStart = clock();
	gpuErrorCheck(hipMemcpy(gpuResult, deviceResult, NO_BYTES, hipMemcpyDeviceToHost));
	memDeviceToHostEnd = clock();

	compareArrays(cpuResult, gpuResult, size);

	printTimeUsingHostClock(cpuStart, cpuEnd, "Total CPU");

	printTimeUsingHostClock(memHostToDeviceStart, memHostToDeviceEnd, "Mem Transfer Host to Device");
	printTimeUsingHostClock(gpuStart, gpuEnd);
	printTimeUsingHostClock(memDeviceToHostStart, memDeviceToHostEnd, "Mem Transfer Device to Host");

	printTimeUsingHostClock(memHostToDeviceStart+gpuStart+memDeviceToHostStart, memHostToDeviceEnd+gpuEnd+memDeviceToHostEnd, "Total GPU");

	gpuErrorCheck(hipFree(deviceA));
	gpuErrorCheck(hipFree(deviceB));
	gpuErrorCheck(hipFree(deviceResult));

	free(hostA);
	free(hostB);
	free(cpuResult);
	free(gpuResult);
}
