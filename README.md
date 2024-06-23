# ROCM/HIP Programming Masterclass

## What is It?

CUDA Examples but ported to work with ROCM/HIP.

[Course Link](https://udemy.com/course/cuda-programming-masterclass/)

## Installation

This repository requires an AMD GPU and preferably ROCM 5.4.x or higher toolchain
to run. See [ROCM Documentation](https://rocmdocs.amd.com/) on how to get started.

### Legacy Method for Docker Installation

When I tried installing it on some distributions, AMD ROCM's Installer was giving me
a hard time. To that goal, I had simplified some of the steps required to launch this
on any **Linux Distribution**, worked with [AMD's ROCM Examples](https://github.com/ROCm/rocm-examples/pull/26)
and supplied patches to make it easy to anybody to build and run it.

This documentation was written before AMD created official [Docker Images](https://hub.docker.com/r/rocm/rocm-terminal).

Follow the Documentation on the Docker Hub or ROCM Documentation Instead. This method is
for those who have the penchant for more pain:

1. Ensure you have the `amdgpu` driver and the card running on your **Linux Distribution**. Verify
that it shows up in the `lsmod` command. You will need all the `GPU Firmware` to be in `/lib/firmware`
in order for the whole shebang to run well.

2. Install [Docker](https://www.docker.com) on your **Linux Distribution**.

3. Scroll down to the steps found in [this GitHub Gist](https://gist.github.com/guilt/6c901f7ac0a726685b6334798da77c00). Use the
Scripts given to get your Docker running.

4. Download the scripts from the Gist and build the `rocm-examples` container.

5. Git clone this repository on your computer. From within this directory, run:

```shell
./Scripts/launch-hipmc.sh
```

6. You will be in a **Docker Container** named `hip-examples` and with everything
ready to go. You will see this Git repository mounted `/workspace/hip-examples`
and this README within it.

7. Now you can get to work, follow the course.

## Compiling

For most programs, you just run `hipcc`. The invocation is very
similar to `nvcc`.

```shell
cd 01-Hello
hipcc -o 01-Hello.out 01-Hello.hip \
      -I ../Common ../Common/*.cpp ../Common/*.hip
./01-Hello.out
```

Things like `rocprof` are there to profile those applications, but do not have the
same amount of robustness as `nvprof`.

For most CUDA API calls, most things are `cu` or `cuda` replaced by `hip`. I've
ported the `cudaCommon.cu[h]` to `hipCommon.hip[h]` in the `Common/` directory.

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
* Email : me@karthikkumar.org

