#include <hip/hip_runtime.h>
#include <hipCommon.hiph>
#include <stdio.h>

__global__ void occupancyTest(int* results)
{
    int gid = blockDim.x * blockIdx.x + threadIdx.x;

    int x1 = 1;
    int x2 = 2;
    int x3 = 3;
    int x4 = 4;
    int x5 = 5;
    int x6 = 6;
    int x7 = 7;
    int x8 = 8;
    results[gid] = x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8;
}

int main()
{
    int size = 1 << 16;
    int byteSize = sizeof(int) * size;

    int* deviceResults;

    gpuErrorCheck(hipMalloc((void**)&deviceResults, byteSize));
    hipMemset(deviceResults, 0, byteSize);

    dim3 blocks(128);
    dim3 grid((size + blocks.x - 1) / blocks.x);
    occupancyTest<<<grid, blocks>>>(deviceResults);

    hipDeviceSynchronize();
    return 0;
}
