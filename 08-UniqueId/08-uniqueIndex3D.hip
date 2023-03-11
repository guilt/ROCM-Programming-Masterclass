#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>

__global__ void uniqueIndexCalcGridThreadIdx(int* input)
{
    int numThreadsInABlock = blockDim.x * blockDim.y * blockDim.z;

    int uniqBlockId = (gridDim.x * gridDim.y * blockIdx.z) +
        (gridDim.x * blockIdx.y) + blockIdx.x;

    int uniqThreadId = (blockDim.x * blockDim.y * threadIdx.z) +
        (blockDim.x * threadIdx.y) + threadIdx.x;

    int uniqId = (numThreadsInABlock * uniqBlockId) + uniqThreadId;

    printf("blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, "
           "threadIdx.x : %d, threadIdx.y : %d, threadIdx.z : %d, "
           "uniqId : %d, value :  %d \n",
           (int)blockIdx.x, (int)blockIdx.y, (int)blockIdx.z,
           (int)threadIdx.x, (int)threadIdx.y, (int)threadIdx.z, uniqId,
           input[uniqId]);
}

int main()
{
    int arraySize = 64;
    int arrayByteSize = sizeof(int) * arraySize;
    int hostData[] = {0,  1,  2,  3,  4,  5,  6,  7,  10, 11, 12, 13, 14,
                      15, 16, 17, 20, 21, 22, 23, 24, 25, 26, 27, 30, 31,
                      32, 33, 34, 35, 36, 37, 40, 41, 42, 43, 44, 45, 46,
                      47, 50, 51, 52, 53, 54, 55, 56, 57, 60, 61, 62, 63,
                      64, 65, 66, 67, 70, 71, 72, 73, 74, 75, 76, 77};

    printf("Array: \n");
    for (int i = 0; i < arraySize; i++)
    {
        printf("%d ", hostData[i]);
    }
    printf("\n");

    int* deviceData;
    hipMalloc((void**)&deviceData, arrayByteSize);
    hipMemcpy(deviceData, hostData, arrayByteSize, hipMemcpyHostToDevice);

    dim3 block(2, 2, 2);
    dim3 grid(2, 2, 2);

    uniqueIndexCalcGridThreadIdx<<<grid, block>>>(deviceData);
    hipDeviceSynchronize();

    hipDeviceReset();
    return 0;
}
