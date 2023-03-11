#include <hip/hip_runtime.h>
#include <stdio.h>

__global__ void printIndex()
{
    printf("BlockId: %d,%d,%d GridDim: %d,%d,%d ThreadId: %d,%d,%d "
           "BlockDim: %d,%d,%d\n",
           (int)blockIdx.x, (int)blockIdx.y, (int)blockIdx.z,
           (int)gridDim.x, (int)gridDim.y, (int)gridDim.z,
           (int)threadIdx.x, (int)threadIdx.y, (int)threadIdx.z,
           (int)blockDim.x, (int)blockDim.y, (int)blockDim.z);
}

int main()
{
    int nx = 16, ny = 16, nz = 16;
    dim3 blockSize = {3, 3, 3};
    dim3 dimSize = {(nx + blockSize.x - 1) / blockSize.x,
                    (ny + blockSize.y - 1) / blockSize.y,
                    (nz + blockSize.z - 1) / blockSize.z};
    printIndex<<<dimSize, blockSize>>>();
    hipDeviceSynchronize();
    return 0;
}
