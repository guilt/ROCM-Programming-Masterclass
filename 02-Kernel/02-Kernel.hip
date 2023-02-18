#include <stdio.h>

#include <hip/hip_runtime.h>


hipError_t addWithHip(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = threadIdx.x;
    c[i] = a[i] + b[i];
}


int main()
{
    const int arraySize = 6;
    const int a[arraySize] = { 1, 2, 3, 4, 5, 6 };
    const int b[arraySize] = { 10, 20, 30, 40, 50, 60 };
    int c[arraySize] = { 0 };

    // Add vectors in parallel.
    hipError_t hipOperationSuccess = addWithHip(c, a, b, arraySize);
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "addWithHip failed!");
        return 1;
    }

    printf("Sum: {%d,%d,%d,%d,%d,%d} + {%d,%d,%d,%d,%d,%d}  = {%d,%d,%d,%d,%d,%d}\n",
           a[0], a[1], a[2], a[3], a[4], a[5],
           b[0], b[1], b[2], b[3], b[4], b[5],
           c[0], c[1], c[2], c[3], c[4], c[5]
	  );

    // hipDeviceReset must be called before exiting in order for profiling and
    // tracing tools such as Nsight and Visual Profiler to show complete traces.
    hipOperationSuccess = hipDeviceReset();
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipDeviceReset failed!");
        return 1;
    }

    return 0;
}

// Helper function for using CUDA to add vectors in parallel.
hipError_t addWithHip(int *c, const int *a, const int *b, unsigned int size)
{
    int *dev_a = 0;
    int *dev_b = 0;
    int *dev_c = 0;
    hipError_t hipOperationSuccess;

    // Choose which GPU to run on, change this on a multi-GPU system.
    hipOperationSuccess = hipSetDevice(0);
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipSetDevice failed!  Do you have a CUDA-capable GPU installed?");
        goto Error;
    }

    // Allocate GPU buffers for three vectors (two input, one output)    .
    hipOperationSuccess = hipMalloc((void**)&dev_c, size * sizeof(int));
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipMalloc failed!");
        goto Error;
    }

    hipOperationSuccess = hipMalloc((void**)&dev_a, size * sizeof(int));
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipMalloc failed!");
        goto Error;
    }

    hipOperationSuccess = hipMalloc((void**)&dev_b, size * sizeof(int));
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipMalloc failed!");
        goto Error;
    }

    // Copy input vectors from host memory to GPU buffers.
    hipOperationSuccess = hipMemcpy(dev_a, a, size * sizeof(int), hipMemcpyHostToDevice);
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipMemcpy failed!");
        goto Error;
    }

    hipOperationSuccess = hipMemcpy(dev_b, b, size * sizeof(int), hipMemcpyHostToDevice);
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipMemcpy failed!");
        goto Error;
    }

    // Launch a kernel on the GPU with one thread for each element.
    addKernel<<<1, size>>>(dev_c, dev_a, dev_b);

    // Check for any errors launching the kernel
    hipOperationSuccess = hipGetLastError();
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "addKernel launch failed: %s\n", hipGetErrorString(hipOperationSuccess));
        goto Error;
    }
    
    // hipDeviceSynchronize waits for the kernel to finish, and returns
    // any errors encountered during the launch.
    hipOperationSuccess = hipDeviceSynchronize();
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipDeviceSynchronize returned error code %d after launching addKernel!\n", hipOperationSuccess);
        goto Error;
    }

    // Copy output vector from GPU buffer to host memory.
    hipOperationSuccess = hipMemcpy(c, dev_c, size * sizeof(int), hipMemcpyDeviceToHost);
    if (hipOperationSuccess != hipSuccess) {
        fprintf(stderr, "hipMemcpy failed!");
        goto Error;
    }

Error:
    hipFree(dev_c);
    hipFree(dev_a);
    hipFree(dev_b);
    
    return hipOperationSuccess;
}
