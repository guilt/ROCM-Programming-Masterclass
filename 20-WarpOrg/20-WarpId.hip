#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>

#define WARPS_PER_SM 32

__global__ void printDetailsOfWarps()
{
    int uniqBlockId = blockIdx.y * gridDim.x + blockIdx.x;

    int uniqId = (uniqBlockId * blockDim.x) + threadIdx.x;

    int warpId = threadIdx.x / WARPS_PER_SM;

    printf("threadIdx.x : %d, threadIdx.y : %d, "
           "blockId.x : %d, blockId.y : %d, "
           "blockId : %d, warpId : %d, uniqId : %d \n",
           (int)threadIdx.x, (int)threadIdx.y, (int)blockIdx.x,
           (int)blockIdx.y, uniqBlockId, warpId, uniqId);
}

int main()
{
    dim3 blockSize(42);
    dim3 gridSize(2, 2);

    printDetailsOfWarps<<<gridSize, blockSize>>>();
    hipDeviceSynchronize();

    hipDeviceReset();

    return 0;
}
