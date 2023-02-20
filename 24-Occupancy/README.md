# Occupancy Calculator

ROCM does not have an official Occupancy
Calculator, but the community created an
awesome equivalent.

Details are on [this GitHub thread](https://github.com/RadeonOpenCompute/ROCm/issues/1689).

## How to Use

See the attached [XLSX](ROCm-Occupancy-Calculator.xlsx) file.

## How to get Occupancy Parameters for a Kernel

When you compile with the `-save-temps` parameter, `hipcc` generates
a lot of assembly files with details about the kernel statistics just
below it's assembly.

```shell
hipcc -o 24-OccupancyTest.out 24-OccupancyTest.hip -I ../Common/ ../Common/hipCommon.hip -save-temps
```

yields a file `24-OccupancyTest-hip-amdgcn-amd-amdhsa-gfx1030.s` which has this information. Replace
`gfx1030` by the actual architecture your GPU runs.

```asm
; Kernel info:
; codeLenInByte = 84
; NumSgprs: 11
; NumVgprs: 3
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 11
; NumVGPRsForWavesPerEU: 3
; Occupancy: 16
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
```
