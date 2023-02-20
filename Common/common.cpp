#include "common.h"

#include <cfloat>
#include <cstring>
#include <fstream>

#include <time.h>
#ifdef _WIN32
#include <sys/utime.h>
#else
#include <sys/time.h>
#endif

//Print Time using Host Clock
void printTimeUsingHostClock(clock_t start, clock_t end, const char *msg)
{
	printf("%s time : %4.6f \n", msg, 
		(double)((double)(end - start) / CLOCKS_PER_SEC));
}

// Compare Floats
static bool areEqual(float a, float b, float epsilon = FLT_EPSILON) {
    return (fabs(a - b) <= epsilon * std::max(1.0f, std::max(a, b)));
}

//Compare Results
void compareResults(int gpuResult, int cpuResult)
{
	if (gpuResult == cpuResult)
	{
		printf("GPU and CPU results are same \n");
		return;
	}

	printf("GPU and CPU results are different \n");
	printf("GPU result : %d, CPU result : %d \n",
		gpuResult, cpuResult);
}

//Compare Results
void compareResults(float gpuResult, float cpuResult)
{
	if (areEqual(gpuResult, cpuResult))
	{
		printf("GPU and CPU results are same \n");
		return;
	}

	printf("GPU and CPU results are different \n");
	printf("GPU result : %.2f, CPU result : %.2f \n",
		gpuResult, cpuResult);
}

//Simple Array Initialization
void initializeArray(int * input, const int arraySize,
	INIT_PARAM PARAM, int x)
{
	if (PARAM == INIT_ZERO)
	{
		for (int i = 0; i < arraySize; i++)
		{
			input[i] = 0;
		}
	}
	else if (PARAM == INIT_ONE)
	{
		for (int i = 0; i < arraySize; i++)
		{
			input[i] = 1;
		}
	}
	else if (PARAM == INIT_ONE_TO_TEN)
	{
		for (int i = 0; i < arraySize; i++)
		{
			input[i] = i % 10;
		}
	}
	else if (PARAM == INIT_RANDOM)
	{
		srand(time(NULL));
		for (int i = 0; i < arraySize; i++)
		{
			input[i] = (int)(rand() % (x+1));
		}
	}
	else if (PARAM == INIT_FOR_SPARSE_MATRIX)
	{
		int value;
		srand(time(NULL));
		for (int i = 0; i < arraySize; i++)
		{
			value = rand() % 25;
			if (value < 5)
			{
				input[i] = value;
			}
			else
			{
				input[i] = 0;
			}
		}
	}
}

//Simple Array Initialization
void initializeArray(float * input, const int arraySize,
	INIT_PARAM PARAM, int x)
{
	if (PARAM == INIT_ZERO)
	{
		for (int i = 0; i < arraySize; i++)
		{
			input[i] = 0;
		}
	}
	else if (PARAM == INIT_ONE)
	{
		for (int i = 0; i < arraySize; i++)
		{
			input[i] = 1;
		}
	}
	else if (PARAM == INIT_ONE_TO_TEN)
	{
		for (int i = 0; i < arraySize; i++)
		{
			input[i] = i % 10;
		}
	}
	else if (PARAM == INIT_RANDOM)
	{
		srand(time(NULL));
		for (int i = 0; i < arraySize; i++)
		{
			input[i] = (rand() % (x+1));
		}
	}
	else if (PARAM == INIT_FOR_SPARSE_MATRIX)
	{
		int value;
		srand(time(NULL));
		for (int i = 0; i < arraySize; i++)
		{
			value = rand() % 25;
			if (value < 5)
			{
				input[i] = value;
			}
			else
			{
				input[i] = 0;
			}
		}
	}
}

//Print Array
void printArray(int * input, const int arraySize)
{
	for (int i = 0; i < arraySize; i++)
	{
		if (!(i == (arraySize - 1)))
		{
			printf("%d,", input[i]);
		}
		else
		{
			printf("%d \n", input[i]);
		}
	}
}

//Print Array
void printArray(float * input, const int arraySize)
{
	for (int i = 0; i < arraySize; i++)
	{
		if (!(i == (arraySize - 1)))
		{
			printf("%.2f,", input[i]);
		}
		else
		{
			printf("%.2f \n", input[i]);
		}
	}
}

//Compare Two Arrays
void compareArrays(int * a, int * b, const int arraySize)
{
	for (int  i = 0; i < arraySize; i++)
	{
		if (a[i] != b[i])
		{
			printf("Arrays are different \n");
			printf("%d - %d vs. %d \n", i, a[i], b[i]);
			return;
		}
	}
	printf("Arrays are same \n");
}

//Compare Two Arrays
void compareArrays(float * a, float * b, const int arraySize)
{
	for (int i = 0; i < arraySize; i++)
	{
		if (!areEqual(a[i], b[i]))
		{
			printf("Arrays are different \n");
			printf("%d - %.2f vs. %.2f \n", i, a[i], b[i]);
			return;
		}
	}
	printf("Arrays are same \n");
}

//Sum Two Arrays with CPU
void sumArraysCpu(int * a, int * b, int * result, const int arraySize)
{
	for (int i = 0; i < arraySize; i++)
	{
		result[i] = a[i] + b[i];
	}
}

//Sum Two Arrays with CPU
void sumArraysCpu(float * a, float * b, float * result, const int arraySize)
{
	for (int i = 0; i < arraySize; i++)
	{
		result[i] = a[i] + b[i];
	}
}

//Sum Three Arrays with CPU
void sumArraysCpu(int * a, int * b, int * c, int * result, const int arraySize)
{
	for (int i = 0; i < arraySize; i++)
	{
		result[i] = a[i] + b[i] + c[i];
	}
}

//Sum Three Arrays with CPU
void sumArraysCpu(float * a, float * b, float * c, float * result, const int arraySize)
{
	for (int i = 0; i < arraySize; i++)
	{
		result[i] = a[i] + b[i] + c[i];
	}
}

//Array Reduction with CPU
int reductionArrayCpu(int * input, const int arraySize)
{
	int sum = 0;
	for (int i = 0; i < arraySize; i++)
	{
		sum += input[i];
	}
	return sum;
}

//Array Reduction with CPU
float reductionArrayCpu(float * input, const int arraySize)
{
	float sum = 0;
	for (int i = 0; i < arraySize; i++)
	{
		sum += input[i];
	}
	return sum;
}

//Print Array to a File
void printArrayToAFile(int * input, const int arraySize, const char * fileName)
{
	std::ofstream file(fileName);

	if (!file.is_open())
		return;

	for (int i = 0; i < arraySize; i++) {
		file << i << " - " << input[i] << "\n";
	}
	file.close();
}

//Print Array to a File
void printArrayToAFile(float * input, const int arraySize, const char * fileName)
{
	std::ofstream file(fileName);

	if (!file.is_open())
		return;

	for (int i = 0; i < arraySize; i++) {
		file << i << " - " << input[i] << "\n";
	}
	file.close();
}

//Print Arrays to a File Side By Side
void printArraysToAFileSideBySide(int * a, int * b, const int arraySize, const char * fileName)
{
	std::ofstream file(fileName);

	if (!file.is_open())
		return;

	for (int i = 0; i < arraySize; i++) {
		file << i << " - " << a[i] << " - " << b[i] << "\n";
	}
	file.close();
}

//Print Arrays To a File Side by Side
void printArraysToAFileSideBySide(float * a, float * b, const int arraySize, const char * fileName)
{
	std::ofstream file(fileName);

	if (!file.is_open())
		return;

	for (int i = 0; i < arraySize; i++) {
		file << i << " - " << a[i] << " - " << b[i] << "\n";
	}
	file.close();
}

//Initialize Matrix
int* initializeMatrix(const int nx, const int ny, INIT_PARAM PARAM)
{
	int matSize = ny * nx;
	int matrixByteSize = sizeof(int)*matSize;

	int *mat = (int*)malloc(matrixByteSize);

	initializeArray(mat, matSize, PARAM);
	return mat;
}

//Initialize Matrix
float* initializeFloatMatrix(const int nx, const int ny, INIT_PARAM PARAM)
{
	int matSize = ny * nx;
	int matrixByteSize = sizeof(float)*matSize;

	float *mat = (float*)malloc(matrixByteSize);

	initializeArray(mat, matSize, PARAM);
	return mat;
}

//Print Matrix
void printMatrix(int * mat, const int nx, const int ny)
{
	for (int iy = 0; iy < ny; iy++)
	{
		for (int ix = 0; ix < nx; ix++)
		{
			printf("%d ",mat[nx * iy + ix]);
		}
		printf("\n");
	}
	printf("\n");
}

//Print Matrix
void printMatrix(float * mat, const int nx, const int ny)
{
	for (int iy = 0; iy < ny; iy++)
	{
		for (int ix = 0; ix < nx; ix++)
		{
			printf("%.2f ", mat[nx * iy + ix]);
		}
		printf("\n");
	}
	printf("\n");
}

//Print Matrix to a File
void printMatrixToAFile(int * mat, const int nx, const int ny, const char * fileName)
{
	std::ofstream file(fileName);

	if (!file.is_open())
		return;

	for (int iy = 0; iy < ny; iy++)
	{
		for (int ix = 0; ix < nx; ix++)
		{
			file << iy << "," << ix << " - " << mat[nx * iy + ix ] << "\n";
		}
	}
	file.close();
}

//Print Matrix to a File
void printMatrixToAFile(float * mat, const int nx, const int ny, const char * fileName)
{
	std::ofstream file(fileName);

	if (!file.is_open())
		return;

	for (int iy = 0; iy < ny; iy++)
	{
		for (int ix = 0; ix < nx; ix++)
		{
			file << iy << "," << ix << " - " << mat[nx * iy + ix ] << "\n";
		}
	}
	file.close();
}

//Matrix Transpose with CPU
void matrixTransposeCpu(int * mat, int * transpose, const int nx, const int ny)
{
	for (int  iy = 0; iy < ny; iy++)
	{
		for (int  ix = 0; ix < nx; ix++)
		{
			transpose[ix * ny + iy] = mat[iy * nx + ix];
		}
	}
}

//Matrix Transpose with CPU
void matrixTransposeCpu(float * mat, float * transpose, const int nx, const int ny)
{
	for (int  iy = 0; iy < ny; iy++)
	{
		for (int  ix = 0; ix < nx; ix++)
		{
			transpose[ix * ny + iy] = mat[iy * nx + ix];
		}
	}
}
