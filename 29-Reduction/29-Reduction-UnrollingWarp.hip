#include <common.h>
#include <hip/hip_runtime.h>
#include <hipCommon.hiph>
#include <stdio.h>
#include <stdlib.h>

// Reduction with Warp Unrolling
__global__ void reductionWarpUnrolling(int* input, int* temp, int size)
{
    int threadId = threadIdx.x;
    int blockOffset = blockDim.x * blockIdx.x;
    int uniqueIndex = blockOffset + threadId;
    int* inputBlock = input + blockOffset;

    for (int offset = blockDim.x / 2; offset >= 64; offset = offset / 2)
    {
        if (threadId < offset)
        {
            inputBlock[threadId] += inputBlock[threadId + offset];
        }

        __syncthreads();
    }

    if (threadId < 32)
    {
        volatile int* volSharedMem = inputBlock;
        volSharedMem[threadId] += volSharedMem[threadId + 32];
        volSharedMem[threadId] += volSharedMem[threadId + 16];
        volSharedMem[threadId] += volSharedMem[threadId + 8];
        volSharedMem[threadId] += volSharedMem[threadId + 4];
        volSharedMem[threadId] += volSharedMem[threadId + 2];
        volSharedMem[threadId] += volSharedMem[threadId + 1];
    }

    if (threadId == 0)
    {
        temp[blockIdx.x] = inputBlock[0];
    }
}

int main(int argc, char** argv)
{
    int size = 1 << 27; // 128 Mb of data
    int byteSize = size * sizeof(int);
    int blockSize = 256;

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
    reductionWarpUnrolling<<<grid, block>>>(deviceInput, deviceTemp, size);

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
