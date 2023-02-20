# ROC Profiling

## Installation

Ensure you have ROC Profiler Installed:

```shell
apt update
apt install rocprofiler-dev roctracer-dev rocm-utils
```

## Compiling for Profiling

Compile as:

```shell
hipcc -o 25-SumArray.out 25-SumArray.hip -I ../Common ../Common/*.cpp ../Common/*.hip
```

## Running the Profiler

```shell
rocprof ./25-SumArray.out # Arguments
```
