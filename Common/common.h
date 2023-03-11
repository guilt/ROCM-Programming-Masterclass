#ifndef COMMON_H
#define COMMON_H

#include <stdio.h>
#include <stdlib.h>

// Error Checking on CPU
#define cpuErrorCheck(ans, msg)                       \
    do                                                \
    {                                                 \
        bool asserted = (ans);                        \
        cpuAssert(asserted, __FILE__, __LINE__, msg); \
    } while (0);

// Helper for Error Checking on GPU
inline void cpuAssert(bool asserted, const char* file, const int line,
                      const char* msg = NULL, bool abort = true)
{
    if (!asserted)
    {
        fprintf(stderr, "CPUassert: [%s:%d] %s\n", file, line,
                (msg != NULL) ? msg : "");
        if (abort)
            exit(EXIT_FAILURE);
    }
}

// NULL Checking on CPU
#define HANDLE_NULL(a) cpuErrorCheck(((a) != NULL), "Host Memory Failed");

// Array Initialization
enum INIT_PARAM
{
    INIT_ZERO,
    INIT_ONE,
    INIT_ONE_TO_TEN,
    INIT_RANDOM,
    INIT_FOR_SPARSE_MATRIX
};

// Launch Dummy Kernel
inline void launchDummmyKernel()
{
}

// Print Time using Host Clock
void printTimeUsingHostClock(clock_t start, clock_t end,
                             const char* msg = "GPU Kernel Execution");

// Compare Results
void compareResults(int gpuResult, int cpuResult);

// Compare Results
void compareResults(float gpuResult, float cpuResult);

// Simple Array Initialization
void initializeArray(int* input, const int arraySize,
                     INIT_PARAM PARAM = INIT_ONE_TO_TEN, int x = 0xFF);

// Simple Array Initialization
void initializeArray(float* input, const int arraySize,
                     INIT_PARAM PARAM = INIT_ONE_TO_TEN, int x = 0xFF);

// Print Array
void printArray(int* input, const int arraySize);

// Print Array
void printArray(float* input, const int arraySize);

// Print Array with Message
#define printMsgArray(msg, array, arraySize) \
    do                                       \
    {                                        \
        printf("%s: ", msg);                 \
        printArray(array, arraySize);        \
    } while (0);

// Compare Two arrays
void compareArrays(int* a, int* b, const int arraySize);

// Compare Two Arrays
void compareArrays(float* a, float* b, const int arraySize);

// Sum Two Arrays with CPU
void sumArraysCpu(int* a, int* b, int* result, const int arraySize);

// Sum Two Arrays with CPU
void sumArraysCpu(float* a, float* b, float* result, const int arraySize);

// Sum Three Arrays with CPU
void sumArraysCpu(int* a, int* b, int* c, int* result, const int arraySize);

// Sum Three Arrays with CPU
void sumArraysCpu(float* a, float* b, float* c, float* result,
                  const int arraySize);

// Array Reduction with CPU
int reductionArrayCpu(int* input, const int arraySize);

// Array Reduction with CPU
float reductionArrayCpu(float* input, const int arraySize);

// Print Array to a File
void printArrayToAFile(int* input, const int arraySize,
                       const char* fileName);

// Print Array to a File
void printArrayToAFile(float* input, const int arraySize,
                       const char* fileName);

// Print Arrays to a File Side By Side
void printArraysToAFileSideBySide(int* a, int* b, const int arraySize,
                                  const char* fileName);

// Print Arrays to a File Side By Side
void printArraysToAFileSideBySide(float* a, float* b, const int arraySize,
                                  const char* fileName);

// Initialize Matrix
int* initializeMatrix(const int nx, const int ny,
                      INIT_PARAM PARAM = INIT_FOR_SPARSE_MATRIX);

// Initialize Matrix
float* initializeFloatMatrix(const int nx, const int ny,
                             INIT_PARAM PARAM = INIT_FOR_SPARSE_MATRIX);

// Print Matrix
void printMatrix(int* mat, const int nx, const int ny);

// Print Matrix
void printMatrix(float* mat, const int nx, const int ny);

// Print Matrix to a File
void printMatrixToAFile(int* mat, const int nx, const int ny,
                        const char* fileName);

// Print Matrix to a File
void printMatrixToAFile(float* mat, const int nx, const int ny,
                        const char* fileName);

// Print Matrix with Message
#define printMsgMatrix(msg, mat, nx, ny) \
    do                                   \
    {                                    \
        printf("%s: \n", msg);           \
        printMatrix(mat, nx, ny);        \
    } while (0);

// Matrix Transpose with CPU
void matrixTransposeCpu(int* mat, int* transpose, const int nx,
                        const int ny);

// Matrix Transpose with CPU
void matrixTransposeCpu(float* mat, float* transpose, const int nx,
                        const int ny);

#endif // !COMMON_H
