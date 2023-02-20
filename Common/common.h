#ifndef COMMON_H
#define COMMON_H

#include <stdio.h>
#include <stdlib.h>

#define HANDLE_NULL( a ) do { \
				if ( (a) == NULL) { \
					printf( "Host memory failed in %s at line %d\n", \
							__FILE__, __LINE__ );  \
					exit( EXIT_FAILURE ); \
				} \
			} while(0);

//Array Initialization
enum INIT_PARAM{
	INIT_ZERO,
	INIT_ONE,
	INIT_ONE_TO_TEN,
	INIT_RANDOM,
	INIT_FOR_SPARSE_MATRIX
};

//Launch Dummy Kernel
inline void launchDummmyKernel() {}

//Print Time using Host Clock
void printTimeUsingHostClock(clock_t start, clock_t end, const char *msg = "GPU Kernel Execution");

//Compare Results
void compareResults(int gpuResult, int cpuResult);

//Compare Results
void compareResults(float gpuResult, float cpuResult);

//Simple Array Initialization
void initializeArray(int * input, const int arraySize,
	INIT_PARAM PARAM = INIT_ONE_TO_TEN, int x = 0xFF);

//Simple Array Initialization
void initializeArray(float * input, const int arraySize,
	INIT_PARAM PARAM = INIT_ONE_TO_TEN, int x = 0xFF);

//Print Array
void printArray(int * input, const int arraySize);

//Print Array
void printArray(float * input, const int arraySize);

//Print Array with Message
#define printMsgArray(msg, array, arraySize) do { printf("%s: ", msg); printArray(array, arraySize); } while(0);

//Compare Two arrays
void compareArrays(int * a, int * b, const int arraySize);

//Compare Two Arrays
void compareArrays(float * a, float * b, const int arraySize);

//Sum Two Arrays with CPU
void sumArraysCpu(int * a, int * b, int * result, const int arraySize);

//Sum Two Arrays with CPU
void sumArraysCpu(float * a, float * b, float * result, const int arraySize);

//Sum Three Arrays with CPU
void sumArraysCpu(int * a, int * b, int * c, int * result, const int arraySize);

//Sum Three Arrays with CPU
void sumArraysCpu(float * a, float * b, float * c, float * result, const int arraySize);

//Array Reduction with CPU
int reductionArrayCpu(int * input, const int arraySize);

//Array Reduction with CPU
float reductionArrayCpu(float * input, const int arraySize);

//Print Array to a File
void printArrayToAFile(int * input, const int arraySize, const char * fileName);

//Print Array to a File
void printArrayToAFile(float * input, const int arraySize, const char * fileName);

//Print Arrays to a File Side By Side
void printArraysToAFileSideBySide(int * a, int * b, const int arraySize, const char * fileName);

//Print Arrays to a File Side By Side
void printArraysToAFileSideBySide(float * a, float * b, const int arraySize, const char * fileName);

//Initialize Matrix
int* initializeMatrix(const int nx, const int ny, INIT_PARAM PARAM=INIT_FOR_SPARSE_MATRIX);

//Initialize Matrix
float* initializeFloatMatrix(const int nx, const int ny, INIT_PARAM PARAM=INIT_FOR_SPARSE_MATRIX);

//Print Matrix
void printMatrix(int * mat, const int nx, const int ny);

//Print Matrix
void printMatrix(float * mat, const int nx, const int ny);

//Print Matrix to a File
void printMatrixToAFile(int * mat, const int nx, const int ny, const char * fileName);

//Print Matrix to a File
void printMatrixToAFile(float * mat, const int nx, const int ny, const char * fileName);

//Print Matrix with Message
#define printMsgMatrix(msg, mat, nx, ny) do { printf("%s: \n", msg); printMatrix(mat, nx, ny); } while(0);

//Matrix Transpose with CPU
void matrixTransposeCpu(int * mat, int * transpose, const int nx, const int ny);

//Matrix Transpose with CPU
void matrixTransposeCpu(float * mat, float * transpose, const int nx, const int ny);

#endif // !COMMON_H
