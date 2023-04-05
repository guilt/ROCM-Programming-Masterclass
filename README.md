# HIP Programming Masterclass

## What is It?

CUDA Examples but ported to work with ROCM/HIP.

[Course Link](https://udemy.com/course/cuda-programming-masterclass/)

## Installation

This repository requires an AMD GPU and preferably ROCM 5.4.x or higher toolchain
to run. See [ROCM Documentation](https://docs.amd.com/bundle/ROCm-Release-Notes-v5.4).

As of now, these are only available for select **Linux Distributions**.

## Easy Docker Installation

1. First Install [Docker](https://www.docker.com) on your **Linux Distribution**.

2. Next, go through the steps found in [this GitHub Gist](https://gist.github.com/guilt/6c901f7ac0a726685b6334798da77c00).

3. Download the scripts from the Gist and build the `rocm-examples` container.

4. Git clone this repository on your computer. From within this directory, run:

```shell
./Scripts/launch-hipmc.sh
```

5. You will be in a **Docker Container** named `hip-examples` and with everything
ready to go. You will see this Git repository mounted `/workspace/hip-examples'
and this README within it.

6. Now you can get to work, follow the course.

## Compiling

For most programs, you just run `hipcc`. The invocation is very
similar to `nvcc`.

```shell
cd 01-Hello
hipcc -o 01-Hello.out 01-Hello.hip -I ../Common ../Common/*.cpp ../Common/*.hip
./01-Hello.out
```

Things like `rocprof` are there to profile those applications, but do not have the
same amount of robustness as `nvprof`.

For most CUDA API calls, most things are `cu` or `cuda` replaced by `hip`. I've
ported the `cudaCommon.[cu]h` to `hipCommon.hip[h]` in the `Common/` directory.

## Why all this Effort?

I currently do not have a CUDA compatible card. During the pandemic, the
NVIDIA card prices were insane due to the miners. I ended up getting a
RX 6900XT at sale price (wasn't cheap either). Hence, I decided to
make the best of this course.

The next thing is that in order to really learn something, typing the 
whole thing out by hand helps. Despite the best efforts needed to run
most CUDA code as-is on HIP, doing it manually is indeed helping me
learn most calls well.

So if you are taking that course, you need to ideally create your own
repo. In case you do get stuck, this one will be your reference.

## Thank You and Feedback

This code is in no way perfect or bug-free. Pull requests
welcome.

Reach out to me for any feedback.

Now Enjoy!

* Author: Karthik Kumar Viswanathan
* Web   : https://karthikkumar.org
* Email : karthikkumar@gmail.com

