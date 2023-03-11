#include <common.h>
#include <hip/hip_runtime.h>
#include <hipCommon.hiph>
#include <stdio.h>
#include <stdlib.h>

__global__ void reductionRecursive(int* input, int* temp, unsigned int size)
{
    int threadId = threadIdx.x;
    int blockOffset = blockIdx.x * blockDim.x;
    int* inputBlock = input + blockOffset;
    int* tempBlock = &temp[blockIdx.x];

    // Stop Condition
    if (size == 2 && threadId == 0)
    {
        *tempBlock = inputBlock[0] + inputBlock[1];
        return;
    }

    // Nested Invocation
    int inputStride = size >> 1;
    if (inputStride > 1 && threadId < inputStride)
    {
        // In-Place Reduction
        inputBlock[threadId] += inputBlock[threadId + inputStride];
    }

    // Nested Invocation for Child Grids
    if (threadId == 0)
    {
        reductionRecursive<<<1, inputStride>>>(inputBlock, tempBlock,
                                               inputStride);
    }
}

int main(int argc, char** argv)
{
    int size = 1 << 27; // 128 Mb of data
    int byteSize = size * sizeof(int);
    int blockSize = 128;

    int *hostInput, *hostTemp;
    HANDLE_NULL(hostInput = (int*)malloc(byteSize));

    initializeArray(hostInput, size, INIT_RANDOM);

    int cpuResult = reductionArrayCpu(hostInput, size);

    dim3 block(blockSize);
    dim3 grid(size / block.x);

    int tempArrayByteSize = sizeof(int) * grid.x;
    HANDLE_NULL(hostTemp = (int*)malloc(tempArrayByteSize));

    int *deviceInput, *deviceTemp;

    gpuErrorCheck(hipMalloc((void**)&deviceInput, byteSize));
    gpuErrorCheck(hipMalloc((void**)&deviceTemp, tempArrayByteSize));
    gpuErrorCheck(hipMemset(deviceTemp, 0, tempArrayByteSize));
    gpuErrorCheck(hipMemcpy(deviceInput, hostInput, byteSize,
                            hipMemcpyHostToDevice));
    reductionRecursive<<<grid, block>>>(deviceInput, deviceTemp, size);

    gpuErrorCheck(hipDeviceSynchronize());

    gpuErrorCheck(hipMemcpy(hostTemp, deviceTemp, tempArrayByteSize,
                            hipMemcpyDeviceToHost));

    int gpuResult = 0;

    for (int i = 0; i < grid.x; i++)
    {
        gpuResult += hostTemp[i];
    }

    // validity check
    compareResults(gpuResult, cpuResult);

    gpuErrorCheck(hipFree(deviceTemp));
    gpuErrorCheck(hipFree(deviceInput));

    free(hostTemp);
    free(hostInput);

    gpuErrorCheck(hipDeviceReset());
    return 0;
}
