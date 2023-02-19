#include "hipCommon.hiph"

void queryDevice(const int deviceNum)
{
	hipDeviceProp_t iProp;
	hipGetDeviceProperties(&iProp, deviceNum);

	printf("Device %d: %s\n", deviceNum, iProp.name);
	printf("  Number of multiprocessors:                     %d\n",
		iProp.multiProcessorCount);
	printf("  Compute capability       :                     %d.%d\n",
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
	printf("  Maximum Grid size                         :    (%d,%d,%d)\n",
		iProp.maxGridSize[0], iProp.maxGridSize[1], iProp.maxGridSize[2]);
	printf("  Maximum block dimension                   :    (%d,%d,%d)\n",
		iProp.maxThreadsDim[0], iProp.maxThreadsDim[1], iProp.maxThreadsDim[2]);
}
