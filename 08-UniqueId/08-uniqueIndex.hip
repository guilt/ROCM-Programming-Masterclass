#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>

__global__ void uniqueIndexCalcThreadIdx(int* input)
{
    int uniqId = threadIdx.x;

    printf("uniqId : %d, value : %d \n", uniqId, input[uniqId]);
}

__global__ void uniqueIndexCalcGridThreadIdx(int* input)
{
    int numThreadsInABlock = blockDim.x;

    int uniqBlockId = blockIdx.x;

    int uniqThreadId = threadIdx.x;

    int uniqId = (numThreadsInABlock * uniqBlockId) + uniqThreadId;

    printf("blockIdx.x : %d, "
           "threadIdx.x : %d, "
           "uniqId : %d, value : %d \n",
           (int)blockIdx.x, (int)threadIdx.x, uniqId, input[uniqId]);
}

int main()
{
    int arraySize = 16;
    int arrayByteSize = sizeof(int) * arraySize;
    int hostData[] = {23, 9,  4,  53, 65,  12, 1,  33,
                      87, 45, 23, 12, 342, 56, 44, 99};

    printf("Array: \n");
    for (int i = 0; i < arraySize; i++)
    {
        printf("%d ", hostData[i]);
    }
    printf("\n");

    int* deviceData;
    hipMalloc((void**)&deviceData, arrayByteSize);
    hipMemcpy(deviceData, hostData, arrayByteSize, hipMemcpyHostToDevice);

    dim3 block1(16);
    dim3 grid1(1);

    uniqueIndexCalcThreadIdx<<<grid1, block1>>>(deviceData);

    dim3 block(4);
    dim3 grid(4);

    uniqueIndexCalcGridThreadIdx<<<grid, block>>>(deviceData);
    hipDeviceSynchronize();

    hipDeviceReset();
    return 0;
}
