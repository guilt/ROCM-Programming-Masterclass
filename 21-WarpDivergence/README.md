# ROC Profiling

## Installation

Ensure you have ROC Profiler Installed:

```shell
apt update
apt install rocprofiler-dev roctracer-dev rocm-utils
```

## Compiling for Profiling

Compile in Debug and remove Optimizations:

```shell
hipcc -O0 -g -o 21-WarpDivergence.out 21-WarpDivergence.hip
```

## Running the Profiler

```shell
 rocprof --hip-trace ./21-WarpDivergence.out
```

## Results

See the `results.stats.csv` file.

```csv
"Name","Calls","TotalDurationNs","AverageNs","Percentage"
"codeWithDivergence()",1,241240019,241240019,63.55495704375221
"codeWithoutDivergence()",1,138337012,138337012,36.44504295624779
```
