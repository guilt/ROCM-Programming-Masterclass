# HIP Programming Masterclass

## What is It?

CUDA Examples but ported to work with ROCM/HIP.

[Course Link](https://udemy.com/course/cuda-programming-masterclass/)

## Installation

This repository requires an AMD GPU and preferably ROCM 5.4.x or higher toolchain
to run. See [ROCM Documentation](https://docs.amd.com/bundle/ROCm-Release-Notes-v5.4).

For a Dockerized installation, see [ROCM-Examples](https://github.com/amd/rocm-examples).

## Compiling

For most programs, you just run `hipcc`. The invocation is very
similar to `nvcc`.

```shell
cd 01-Hello
hipcc -o 01-Hello.out 01-Hello.hip
./01-Hello.out
```

## Why?

I currently do not have a CUDA compatible card. During the pandemic, the
NVIDIA card prices were insane due to the miners. I ended up getting a
RX 6900XT at sale price (wasn't cheap either). Hence, I decided to
make the best of this course.

## Contact

This code is in no way perfect or bug-free. Pull requests
and feedback welcome.
