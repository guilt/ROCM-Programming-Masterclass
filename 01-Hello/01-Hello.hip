#include <stdio.h>

#include <hip/hip_runtime.h>

__global__ void helloWorld()
{
	printf("Hello HIP world \n");
}

int main()
{
	int nx = 16, ny = 16;

	dim3 threadsPerBlock(4, 2);
	dim3 gridSizeInBlocks(nx / threadsPerBlock.x, ny / threadsPerBlock.y);

	helloWorld <<< gridSizeInBlocks, threadsPerBlock >>> ();
	hipDeviceSynchronize();

	hipDeviceReset();
	return 0;
}
