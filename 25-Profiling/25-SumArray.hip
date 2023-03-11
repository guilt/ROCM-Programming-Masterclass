#include <common.h>
#include <hip/hip_runtime.h>
#include <hipCommon.hiph>
#include <stdio.h>
#include <stdlib.h>

// assume grid is 1D and block is 1D then nx = size
__global__ void sumArrays1DGridDevice1DBlock(float* a, float* b, float* c,
                                             int nx)
{
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // if (gid < nx)
    c[gid] = a[gid] + b[gid];
}

// assume grid is 2D and block is 2D then nx * ny = size
__global__ void sumArrays2DGridDevice2DBlock(float* a, float* b, float* c,
                                             int nx, int ny)
{
    int gidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gidy = blockIdx.y * blockDim.y + threadIdx.y;

    int gid = gidy * nx + gidx;

    // if(gidx < nx && gidy < ny)
    c[gid] = a[gid] + b[gid];
}

void runSumArray1D(int argc, char** argv)
{
    printf("Running 1D grid \n");
    int size = 1 << 22;
    int blockSize = 128;

    if (argc > 2)
        size = 1 << atoi(argv[2]);

    if (argc > 4)
        blockSize = 1 << atoi(argv[4]);

    unsigned int byteSize = size * sizeof(float);

    printf("Input size : %d \n", size);

    float *hostA, *hostB, *hostOut, *hostRef;
    HANDLE_NULL(hostA = (float*)malloc(byteSize));
    HANDLE_NULL(hostB = (float*)malloc(byteSize));
    HANDLE_NULL(hostOut = (float*)malloc(byteSize));
    HANDLE_NULL(hostRef = (float*)malloc(byteSize));

    for (size_t i = 0; i < size; i++)
    {
        hostA[i] = i % 10;
        hostB[i] = i % 7;
    }

    sumArraysCpu(hostA, hostB, hostOut, size);

    dim3 block(blockSize);
    dim3 grid((size + block.x - 1) / block.x);

    printf("Kernel is launched with grid(%d,%d,%d) and block(%d,%d,%d) \n",
           grid.x, grid.y, grid.z, block.x, block.y, block.z);

    float *deviceA, *deviceB, *deviceC;

    gpuErrorCheck(hipMalloc((void**)&deviceA, byteSize));
    gpuErrorCheck(hipMalloc((void**)&deviceB, byteSize));
    gpuErrorCheck(hipMalloc((void**)&deviceC, byteSize));

    gpuErrorCheck(hipMemcpy(deviceA, hostA, byteSize, hipMemcpyHostToDevice));
    gpuErrorCheck(hipMemcpy(deviceB, hostB, byteSize, hipMemcpyHostToDevice));
    gpuErrorCheck(hipMemset(deviceC, 0, byteSize));

    sumArrays1DGridDevice1DBlock<<<grid, block>>>(deviceA, deviceB,
                                                  deviceC, size);

    gpuErrorCheck(hipDeviceSynchronize());
    gpuErrorCheck(
        hipMemcpy(hostRef, deviceC, byteSize, hipMemcpyDeviceToHost));
    compareArrays(hostOut, hostRef, size);

    hipFree(deviceC);
    hipFree(deviceB);
    hipFree(deviceA);

    free(hostRef);
    free(hostOut);
    free(hostB);
    free(hostA);
}

void runSumArray2D(int argc, char** argv)
{
    printf("Running 2D grid \n");

    int size = 1 << 22; // 4194304
    int blockX = 128;

    int nx = 1 << 14; // 16384
    int ny;
    int blockY = 8;

    if (argc > 2)
        size = 1 << atoi(argv[2]);

    if (argc > 3)
        nx = 1 << atoi(argv[3]);

    ny = size / nx;
    if (ny == 0)
    {
        printf("ny is invalid.\n");
        return;
    }

    if (argc > 4)
    {
        int pow = atoi(argv[4]);
        if (pow < 3 || pow > 10)
        {
            printf("Block size is invalid.\n");
            return;
        }
        blockX = 1 << pow;
        blockY = 1024 / blockX;
    }

    if (blockY < 1 || blockY > 1024)
    {
        printf("Block size is invalid.\n");
        return;
    }

    unsigned int byteSize = size * sizeof(float);

    printf("Input size : %d, nx : %d, ny : %d, blockX : %d, blockY : %d "
           "\n",
           size, nx, ny, blockX, blockY);

    float *hostA, *hostB, *hostOut, *hostRef;
    HANDLE_NULL(hostA = (float*)malloc(byteSize));
    HANDLE_NULL(hostB = (float*)malloc(byteSize));
    HANDLE_NULL(hostOut = (float*)malloc(byteSize));
    HANDLE_NULL(hostRef = (float*)malloc(byteSize));

    for (size_t i = 0; i < size; i++)
    {
        hostA[i] = i % 10;
        hostB[i] = i % 7;
    }

    sumArraysCpu(hostA, hostB, hostOut, size);

    dim3 block(blockX, blockY);
    dim3 grid((nx + blockX - 1) / blockX, (ny + blockY - 1) / blockY);

    printf("Kernel is launching with grid(%d,%d,%d) and block(%d,%d,%d)\n",
           grid.x, grid.y, grid.z, block.x, block.y, block.z);

    float *deviceA, *deviceB, *deviceC;

    gpuErrorCheck(hipMalloc((void**)&deviceA, byteSize));
    gpuErrorCheck(hipMalloc((void**)&deviceB, byteSize));
    gpuErrorCheck(hipMalloc((void**)&deviceC, byteSize));

    gpuErrorCheck(hipMemcpy(deviceA, hostA, byteSize, hipMemcpyHostToDevice));
    gpuErrorCheck(hipMemcpy(deviceB, hostB, byteSize, hipMemcpyHostToDevice));
    gpuErrorCheck(hipMemset(deviceC, 0, byteSize));

    sumArrays2DGridDevice2DBlock<<<grid, block>>>(deviceA, deviceB,
                                                  deviceC, nx, ny);
    gpuErrorCheck(hipDeviceSynchronize());
    gpuErrorCheck(
        hipMemcpy(hostRef, deviceC, byteSize, hipMemcpyDeviceToHost));

    compareArrays(hostOut, hostRef, size);

    hipFree(deviceC);
    hipFree(deviceB);
    hipFree(deviceA);

    free(hostRef);
    free(hostOut);
    free(hostB);
    free(hostA);
}

////arguments :
////1 - kernel (0:1D or 1:2D),
////2 - input size (2 pow (x))
////3 - for 2D kernel nx
////4 - for 2D kernel block.x
////5 - for 2D kernel block.y
int main(int argc, char** argv)
{
    printf("Sum Array Example for HIPROF\n\n");
    if (argc > 1)
    {
        if (atoi(argv[1]) > 0)
        {
            runSumArray2D(argc, argv);
        }
        else
        {
            runSumArray1D(argc, argv);
        }
    }
    else
    {
        runSumArray1D(argc, argv);
    }

    return 0;
}
