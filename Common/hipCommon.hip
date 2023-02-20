#include "hipCommon.hiph"

//DDR RAM doubles bandwidth.
#define MEMORY_CLOCK_MULTIPLIER 2 

void queryDevice(const int deviceNum)
{
	int deviceCount = 0;   
	hipGetDeviceCount(&deviceCount);

	if (deviceNum >= deviceCount)
	{
		printf("No HIP support device found");
		return;
	}

	hipDeviceProp_t iProp;
	hipGetDeviceProperties(&iProp, deviceNum);

	printf("Device %d: %s\n", deviceNum, iProp.name);
	printf("  Number of multiprocessors:                     %d\n",
		iProp.multiProcessorCount);
	printf("  Clock rate:                                    %4.2f MHz\n",
		iProp.clockRate / 1000.0);
	printf("  Memory Clock rate:                             %4.2f MHz\n",
		( iProp.memoryClockRate * MEMORY_CLOCK_MULTIPLIER ) / 1000.0);
	printf("  Memory Bus Width:                              %d bits, %d bytes\n",
		iProp.memoryBusWidth, iProp.memoryBusWidth / 8);
	printf("  Compute capability:                            %d.%d\n",
		iProp.major,iProp.minor);
	printf("  Total amount of global memory:                 %4.2f kB\n",
		iProp.totalGlobalMem/ 1024.0);
	printf("  Total amount of constant memory:               %4.2f kB\n",
		iProp.totalConstMem / 1024.0);
	printf("  Total amount of shared memory per block:       %4.2f kB\n",
		iProp.sharedMemPerBlock / 1024.0);
	printf("  Total amount of shared memory per MP:          %4.2f kB\n",
		iProp.maxSharedMemoryPerMultiProcessor / 1024.0);
	printf("  Total number of registers available per block: %d\n",
		iProp.regsPerBlock);
	printf("  Warp size:                                     %d\n",
		iProp.warpSize);
	printf("  Maximum number of threads per block:           %d\n",
		iProp.maxThreadsPerBlock);
	printf("  Maximum number of threads per multiprocessor:  %d\n",
		iProp.maxThreadsPerMultiProcessor);
	printf("  Maximum number of warps per multiprocessor:    %d\n",
		iProp.maxThreadsPerMultiProcessor / 32);
	printf("  Maximum Grid size:                             (%d,%d,%d)\n",
		iProp.maxGridSize[0], iProp.maxGridSize[1], iProp.maxGridSize[2]);
	printf("  Maximum Block dimension:                       (%d,%d,%d)\n",
		iProp.maxThreadsDim[0], iProp.maxThreadsDim[1], iProp.maxThreadsDim[2]);
}
