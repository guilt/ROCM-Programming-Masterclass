#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>

__global__ void codeWithoutDivergence()
{
    int uniqId = blockIdx.x * blockDim.x + threadIdx.x;

    float a, b;
    a = b = 0;

    int warpId = uniqId / 32;

    if (warpId % 2 == 0)
    {
        a = 100.0;
        b = 50.0;
    }
    else
    {
        a = 200;
        b = 75;
    }
}

__global__ void codeWithDivergence()
{
    int uniqId = blockIdx.x * blockDim.x + threadIdx.x;

    float a, b;
    a = b = 0;

    if (uniqId % 2 == 0)
    {
        a = 100.0;
        b = 50.0;
    }
    else
    {
        a = 200;
        b = 75;
    }
}

int main(int argc, char** argv)
{
    int size = 1 << 28;

    dim3 blockSize(128);
    dim3 gridSize((size + blockSize.x - 1) / blockSize.x);

    codeWithoutDivergence<<<gridSize, blockSize>>>();
    hipDeviceSynchronize();

    codeWithDivergence<<<gridSize, blockSize>>>();
    hipDeviceSynchronize();

    hipDeviceReset();
    return 0;
}
