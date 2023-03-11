#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

__global__ void dynamicParallelismCheck(int size, int depth)
{
    int threadId = threadIdx.x;
    printf("Depth : %d - ThreadId : %d\n", depth, threadId);

    if (size == 1)
        return;

    if (threadId == 0)
    {
        dynamicParallelismCheck<<<1, size / 2>>>(size / 2, depth + 1);
    }
}

int main(int argc, char** argv)
{
    dynamicParallelismCheck<<<1, 16>>>(16, 0);
    hipDeviceSynchronize();
    hipDeviceReset();
    return 0;
}
