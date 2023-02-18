
# __CLANG_OFFLOAD_BUNDLE____START__ hip-amdgcn-amd-amdhsa-gfx1030
	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx1030"
	.protected	_Z10helloWorldv         ; -- Begin function _Z10helloWorldv
	.globl	_Z10helloWorldv
	.p2align	8
	.type	_Z10helloWorldv,@function
_Z10helloWorldv:                        ; @_Z10helloWorldv
; %bb.0:
	s_add_u32 s12, s12, s17
	s_addc_u32 s13, s13, 0
	s_mov_b32 s32, 0
	s_setreg_b32 hwreg(HW_REG_FLAT_SCR_LO), s12
	s_setreg_b32 hwreg(HW_REG_FLAT_SCR_HI), s13
	s_load_dwordx2 s[28:29], s[8:9], 0x18
	v_lshlrev_b32_e32 v2, 20, v2
	v_lshlrev_b32_e32 v1, 10, v1
	v_mov_b32_e32 v3, 0
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_or3_b32 v31, v0, v1, v2
	v_mov_b32_e32 v2, 33
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v0, s28
	v_mov_b32_e32 v1, s29
	s_mov_b32 s24, s16
	s_add_u32 s0, s0, s17
	s_addc_u32 s1, s1, 0
	s_mov_b32 s13, s15
	s_mov_b32 s12, s14
	s_mov_b32 s14, s24
	s_mov_b64 s[16:17], s[10:11]
	s_mov_b64 s[18:19], s[8:9]
	s_mov_b64 s[20:21], s[6:7]
	s_mov_b64 s[22:23], s[4:5]
	s_getpc_b64 s[26:27]
	s_add_u32 s26, s26, __ockl_hostcall_internal@rel32@lo+4
	s_addc_u32 s27, s27, __ockl_hostcall_internal@rel32@hi+12
	v_mov_b32_e32 v27, 0
	s_swappc_b64 s[30:31], s[26:27]
	v_mov_b32_e32 v25, v0
	v_mov_b32_e32 v24, v1
	s_getpc_b64 s[4:5]
	s_add_u32 s4, s4, .str@rel32@lo+4
	s_addc_u32 s5, s5, .str@rel32@hi+12
	s_mov_b32 s6, -1
	s_cmp_lg_u64 s[4:5], 0
	s_cbranch_scc0 .LBB1_53
; %bb.1:
	v_and_b32_e32 v23, -3, v25
	s_mov_b32 s7, 0
	s_cselect_b32 s6, 18, 0
	v_mov_b32_e32 v29, s5
	v_mov_b32_e32 v33, s7
	v_mov_b32_e32 v2, v23
	v_mov_b32_e32 v28, s4
	v_mov_b32_e32 v32, s6
	v_mov_b32_e32 v3, v24
	v_mov_b32_e32 v4, v25
	v_mov_b32_e32 v5, v26
	s_branch .LBB1_4
.LBB1_2:                                ;   in Loop: Header=BB1_4 Depth=1
	s_clause 0x5
	global_load_ubyte v16, v[0:1], off offset:2
	global_load_ubyte v17, v[0:1], off offset:3
	global_load_ubyte v18, v[0:1], off offset:1
	global_load_ubyte v19, v[0:1], off offset:5
	global_load_ubyte v20, v[0:1], off offset:4
	global_load_ubyte v21, v[0:1], off
	v_mov_b32_e32 v22, v27
	s_clause 0x1
	global_load_ubyte_d16_hi v22, v[0:1], off offset:6
	global_load_ubyte v23, v[0:1], off offset:7
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v26, 0xffff, v16
	v_lshlrev_b64 v[0:1], 16, v[26:27]
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v26, 0xffff, v17
	v_lshlrev_b64 v[16:17], 24, v[26:27]
	v_or_b32_e32 v1, v1, v17
	s_waitcnt vmcnt(5)
	v_lshlrev_b16 v17, 8, v18
	s_waitcnt vmcnt(4)
	v_lshlrev_b32_e32 v18, 8, v19
	s_waitcnt vmcnt(3)
	v_or_b32_e32 v1, v1, v20
	s_waitcnt vmcnt(2)
	v_or_b32_e32 v17, v17, v21
	v_or_b32_e32 v1, v1, v18
	v_or_b32_sdwa v0, v17, v0 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	s_waitcnt vmcnt(0)
	v_lshlrev_b32_e32 v17, 24, v23
	v_or_b32_e32 v1, v1, v22
	v_or_b32_e32 v16, v0, v16
	v_or_b32_e32 v17, v1, v17
.LBB1_3:                                ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_lt_u64_e32 vcc_lo, 56, v[32:33]
	v_lshlrev_b32_e32 v0, 2, v34
	v_or_b32_e32 v1, 2, v2
	s_mov_b64 s[4:5], s[22:23]
	s_mov_b64 s[6:7], s[20:21]
	s_mov_b64 s[8:9], s[18:19]
	v_add_nc_u32_e32 v0, 28, v0
	v_cndmask_b32_e32 v1, v1, v2, vcc_lo
	s_mov_b64 s[10:11], s[16:17]
	s_mov_b32 s14, s24
	v_and_b32_e32 v0, 0x1e0, v0
	v_and_b32_e32 v1, 0xffffff1f, v1
	v_or_b32_e32 v2, v1, v0
	v_mov_b32_e32 v0, s28
	v_mov_b32_e32 v1, s29
	s_swappc_b64 s[30:31], s[26:27]
	v_sub_co_u32 v32, vcc_lo, v32, v34
	v_sub_co_ci_u32_e32 v33, vcc_lo, v33, v35, vcc_lo
	v_add_co_u32 v28, s4, v28, v34
	v_mov_b32_e32 v2, v0
	v_cmp_ne_u64_e32 vcc_lo, 0, v[32:33]
	v_mov_b32_e32 v3, v1
	v_add_co_ci_u32_e64 v29, s4, v29, v35, s4
	s_cbranch_vccz .LBB1_55
.LBB1_4:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_7 Depth 2
                                        ;     Child Loop BB1_15 Depth 2
                                        ;     Child Loop BB1_22 Depth 2
                                        ;     Child Loop BB1_29 Depth 2
                                        ;     Child Loop BB1_36 Depth 2
                                        ;     Child Loop BB1_43 Depth 2
                                        ;     Child Loop BB1_50 Depth 2
	v_cmp_gt_u64_e32 vcc_lo, 56, v[32:33]
	s_mov_b32 s4, -1
                                        ; implicit-def: $vgpr4_vgpr5
	v_cndmask_b32_e32 v34, 56, v32, vcc_lo
	v_cndmask_b32_e32 v35, 0, v33, vcc_lo
	v_cmp_lt_u32_e32 vcc_lo, 7, v34
	s_cbranch_vccnz .LBB1_10
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_eq_u32_e32 vcc_lo, 0, v34
	s_mov_b64 s[6:7], 0
	s_cbranch_vccnz .LBB1_8
; %bb.6:                                ;   in Loop: Header=BB1_4 Depth=1
	v_lshlrev_b64 v[0:1], 3, v[34:35]
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v6, v28
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v7, v29
	.p2align	6
.LBB1_7:                                ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_ubyte v1, v[6:7], off
	v_add_co_u32 v6, vcc_lo, v6, 1
	v_add_co_ci_u32_e32 v7, vcc_lo, 0, v7, vcc_lo
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v26, 0xffff, v1
	v_lshlrev_b64 v[8:9], s6, v[26:27]
	s_add_u32 s6, s6, 8
	s_addc_u32 s7, s7, 0
	v_cmp_ne_u32_e64 s4, s6, v0
	v_or_b32_e32 v4, v8, v4
	v_or_b32_e32 v5, v9, v5
	s_and_b32 vcc_lo, exec_lo, s4
	s_cbranch_vccnz .LBB1_7
	s_branch .LBB1_9
.LBB1_8:                                ;   in Loop: Header=BB1_4 Depth=1
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
.LBB1_9:                                ;   in Loop: Header=BB1_4 Depth=1
	s_mov_b32 s4, 0
.LBB1_10:                               ;   in Loop: Header=BB1_4 Depth=1
	v_mov_b32_e32 v0, v28
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v1, v29
	s_andn2_b32 vcc_lo, exec_lo, s4
	s_cbranch_vccnz .LBB1_12
; %bb.11:                               ;   in Loop: Header=BB1_4 Depth=1
	s_clause 0x5
	global_load_ubyte v0, v[28:29], off offset:2
	global_load_ubyte v4, v[28:29], off offset:3
	global_load_ubyte v6, v[28:29], off offset:1
	global_load_ubyte v7, v[28:29], off offset:5
	global_load_ubyte v8, v[28:29], off offset:4
	global_load_ubyte v9, v[28:29], off
	v_mov_b32_e32 v10, v27
	s_clause 0x1
	global_load_ubyte v11, v[28:29], off offset:7
	global_load_ubyte_d16_hi v10, v[28:29], off offset:6
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v26, 0xffff, v0
	v_lshlrev_b64 v[0:1], 16, v[26:27]
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v26, 0xffff, v4
	v_lshlrev_b64 v[4:5], 24, v[26:27]
	v_or_b32_e32 v1, v1, v5
	s_waitcnt vmcnt(5)
	v_lshlrev_b16 v5, 8, v6
	s_waitcnt vmcnt(4)
	v_lshlrev_b32_e32 v6, 8, v7
	s_waitcnt vmcnt(3)
	v_or_b32_e32 v1, v1, v8
	s_waitcnt vmcnt(2)
	v_or_b32_e32 v5, v5, v9
	v_add_nc_u32_e32 v8, -8, v34
	v_or_b32_e32 v1, v1, v6
	v_or_b32_sdwa v0, v5, v0 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	s_waitcnt vmcnt(1)
	v_lshlrev_b32_e32 v6, 24, v11
	s_waitcnt vmcnt(0)
	v_or_b32_e32 v1, v1, v10
	v_or_b32_e32 v4, v0, v4
	v_add_co_u32 v0, vcc_lo, v28, 8
	v_or_b32_e32 v5, v1, v6
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v29, vcc_lo
.LBB1_12:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_lt_u32_e32 vcc_lo, 7, v8
	s_cbranch_vccnz .LBB1_17
; %bb.13:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_eq_u32_e32 vcc_lo, 0, v8
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	s_mov_b64 s[4:5], 0
	s_cbranch_vccnz .LBB1_16
; %bb.14:                               ;   in Loop: Header=BB1_4 Depth=1
	s_mov_b64 s[6:7], 0
	.p2align	6
.LBB1_15:                               ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_add_co_u32 v9, vcc_lo, v0, s6
	v_add_co_ci_u32_e32 v10, vcc_lo, s7, v1, vcc_lo
	s_add_u32 s6, s6, 1
	s_addc_u32 s7, s7, 0
	v_cmp_ne_u32_e32 vcc_lo, s6, v8
	global_load_ubyte v9, v[9:10], off
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v26, 0xffff, v9
	v_lshlrev_b64 v[9:10], s4, v[26:27]
	s_add_u32 s4, s4, 8
	s_addc_u32 s5, s5, 0
	v_or_b32_e32 v6, v9, v6
	v_or_b32_e32 v7, v10, v7
	s_cbranch_vccnz .LBB1_15
.LBB1_16:                               ;   in Loop: Header=BB1_4 Depth=1
	v_mov_b32_e32 v10, 0
	s_cbranch_execz .LBB1_18
	s_branch .LBB1_19
.LBB1_17:                               ;   in Loop: Header=BB1_4 Depth=1
                                        ; implicit-def: $vgpr6_vgpr7
	v_mov_b32_e32 v10, 0
.LBB1_18:                               ;   in Loop: Header=BB1_4 Depth=1
	s_clause 0x5
	global_load_ubyte v6, v[0:1], off offset:2
	global_load_ubyte v9, v[0:1], off offset:3
	global_load_ubyte v11, v[0:1], off offset:1
	global_load_ubyte v12, v[0:1], off offset:5
	global_load_ubyte v13, v[0:1], off offset:4
	global_load_ubyte v14, v[0:1], off
	v_mov_b32_e32 v15, v27
	s_clause 0x1
	global_load_ubyte v16, v[0:1], off offset:7
	global_load_ubyte_d16_hi v15, v[0:1], off offset:6
	v_add_co_u32 v0, vcc_lo, v0, 8
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v26, 0xffff, v6
	v_lshlrev_b64 v[6:7], 16, v[26:27]
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v26, 0xffff, v9
	v_lshlrev_b64 v[9:10], 24, v[26:27]
	v_or_b32_e32 v7, v7, v10
	s_waitcnt vmcnt(5)
	v_lshlrev_b16 v10, 8, v11
	s_waitcnt vmcnt(4)
	v_lshlrev_b32_e32 v11, 8, v12
	s_waitcnt vmcnt(3)
	v_or_b32_e32 v7, v7, v13
	s_waitcnt vmcnt(2)
	v_or_b32_e32 v10, v10, v14
	v_or_b32_e32 v7, v7, v11
	s_waitcnt vmcnt(1)
	v_lshlrev_b32_e32 v11, 24, v16
	v_or_b32_sdwa v6, v10, v6 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	v_add_nc_u32_e32 v10, -8, v8
	s_waitcnt vmcnt(0)
	v_or_b32_e32 v7, v7, v15
	v_or_b32_e32 v6, v6, v9
	v_or_b32_e32 v7, v7, v11
.LBB1_19:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_lt_u32_e32 vcc_lo, 7, v10
	s_cbranch_vccnz .LBB1_24
; %bb.20:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_eq_u32_e32 vcc_lo, 0, v10
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	s_mov_b64 s[4:5], 0
	s_cbranch_vccnz .LBB1_23
; %bb.21:                               ;   in Loop: Header=BB1_4 Depth=1
	s_mov_b64 s[6:7], 0
	.p2align	6
.LBB1_22:                               ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_add_co_u32 v11, vcc_lo, v0, s6
	v_add_co_ci_u32_e32 v12, vcc_lo, s7, v1, vcc_lo
	s_add_u32 s6, s6, 1
	s_addc_u32 s7, s7, 0
	v_cmp_ne_u32_e32 vcc_lo, s6, v10
	global_load_ubyte v11, v[11:12], off
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v26, 0xffff, v11
	v_lshlrev_b64 v[11:12], s4, v[26:27]
	s_add_u32 s4, s4, 8
	s_addc_u32 s5, s5, 0
	v_or_b32_e32 v8, v11, v8
	v_or_b32_e32 v9, v12, v9
	s_cbranch_vccnz .LBB1_22
.LBB1_23:                               ;   in Loop: Header=BB1_4 Depth=1
	v_mov_b32_e32 v12, 0
	s_cbranch_execz .LBB1_25
	s_branch .LBB1_26
.LBB1_24:                               ;   in Loop: Header=BB1_4 Depth=1
                                        ; implicit-def: $vgpr8_vgpr9
	v_mov_b32_e32 v12, 0
.LBB1_25:                               ;   in Loop: Header=BB1_4 Depth=1
	s_clause 0x5
	global_load_ubyte v8, v[0:1], off offset:2
	global_load_ubyte v11, v[0:1], off offset:3
	global_load_ubyte v13, v[0:1], off offset:1
	global_load_ubyte v14, v[0:1], off offset:5
	global_load_ubyte v15, v[0:1], off offset:4
	global_load_ubyte v16, v[0:1], off
	v_mov_b32_e32 v17, v27
	s_clause 0x1
	global_load_ubyte v18, v[0:1], off offset:7
	global_load_ubyte_d16_hi v17, v[0:1], off offset:6
	v_add_co_u32 v0, vcc_lo, v0, 8
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v26, 0xffff, v8
	v_lshlrev_b64 v[8:9], 16, v[26:27]
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v26, 0xffff, v11
	v_lshlrev_b64 v[11:12], 24, v[26:27]
	v_or_b32_e32 v9, v9, v12
	s_waitcnt vmcnt(5)
	v_lshlrev_b16 v12, 8, v13
	s_waitcnt vmcnt(4)
	v_lshlrev_b32_e32 v13, 8, v14
	s_waitcnt vmcnt(3)
	v_or_b32_e32 v9, v9, v15
	s_waitcnt vmcnt(2)
	v_or_b32_e32 v12, v12, v16
	v_or_b32_e32 v9, v9, v13
	s_waitcnt vmcnt(1)
	v_lshlrev_b32_e32 v13, 24, v18
	v_or_b32_sdwa v8, v12, v8 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	v_add_nc_u32_e32 v12, -8, v10
	s_waitcnt vmcnt(0)
	v_or_b32_e32 v9, v9, v17
	v_or_b32_e32 v8, v8, v11
	v_or_b32_e32 v9, v9, v13
.LBB1_26:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_lt_u32_e32 vcc_lo, 7, v12
	s_cbranch_vccnz .LBB1_31
; %bb.27:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_eq_u32_e32 vcc_lo, 0, v12
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	s_mov_b64 s[4:5], 0
	s_cbranch_vccnz .LBB1_30
; %bb.28:                               ;   in Loop: Header=BB1_4 Depth=1
	s_mov_b64 s[6:7], 0
	.p2align	6
.LBB1_29:                               ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_add_co_u32 v13, vcc_lo, v0, s6
	v_add_co_ci_u32_e32 v14, vcc_lo, s7, v1, vcc_lo
	s_add_u32 s6, s6, 1
	s_addc_u32 s7, s7, 0
	v_cmp_ne_u32_e32 vcc_lo, s6, v12
	global_load_ubyte v13, v[13:14], off
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v26, 0xffff, v13
	v_lshlrev_b64 v[13:14], s4, v[26:27]
	s_add_u32 s4, s4, 8
	s_addc_u32 s5, s5, 0
	v_or_b32_e32 v10, v13, v10
	v_or_b32_e32 v11, v14, v11
	s_cbranch_vccnz .LBB1_29
.LBB1_30:                               ;   in Loop: Header=BB1_4 Depth=1
	v_mov_b32_e32 v14, 0
	s_cbranch_execz .LBB1_32
	s_branch .LBB1_33
.LBB1_31:                               ;   in Loop: Header=BB1_4 Depth=1
                                        ; implicit-def: $vgpr10_vgpr11
	v_mov_b32_e32 v14, 0
.LBB1_32:                               ;   in Loop: Header=BB1_4 Depth=1
	s_clause 0x5
	global_load_ubyte v10, v[0:1], off offset:2
	global_load_ubyte v13, v[0:1], off offset:3
	global_load_ubyte v15, v[0:1], off offset:1
	global_load_ubyte v16, v[0:1], off offset:5
	global_load_ubyte v17, v[0:1], off offset:4
	global_load_ubyte v18, v[0:1], off
	v_mov_b32_e32 v19, v27
	s_clause 0x1
	global_load_ubyte v20, v[0:1], off offset:7
	global_load_ubyte_d16_hi v19, v[0:1], off offset:6
	v_add_co_u32 v0, vcc_lo, v0, 8
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v26, 0xffff, v10
	v_lshlrev_b64 v[10:11], 16, v[26:27]
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v26, 0xffff, v13
	v_lshlrev_b64 v[13:14], 24, v[26:27]
	v_or_b32_e32 v11, v11, v14
	s_waitcnt vmcnt(5)
	v_lshlrev_b16 v14, 8, v15
	s_waitcnt vmcnt(4)
	v_lshlrev_b32_e32 v15, 8, v16
	s_waitcnt vmcnt(3)
	v_or_b32_e32 v11, v11, v17
	s_waitcnt vmcnt(2)
	v_or_b32_e32 v14, v14, v18
	v_or_b32_e32 v11, v11, v15
	s_waitcnt vmcnt(1)
	v_lshlrev_b32_e32 v15, 24, v20
	v_or_b32_sdwa v10, v14, v10 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	v_add_nc_u32_e32 v14, -8, v12
	s_waitcnt vmcnt(0)
	v_or_b32_e32 v11, v11, v19
	v_or_b32_e32 v10, v10, v13
	v_or_b32_e32 v11, v11, v15
.LBB1_33:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_lt_u32_e32 vcc_lo, 7, v14
	s_cbranch_vccnz .LBB1_38
; %bb.34:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_eq_u32_e32 vcc_lo, 0, v14
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	s_mov_b64 s[4:5], 0
	s_cbranch_vccnz .LBB1_37
; %bb.35:                               ;   in Loop: Header=BB1_4 Depth=1
	s_mov_b64 s[6:7], 0
	.p2align	6
.LBB1_36:                               ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_add_co_u32 v15, vcc_lo, v0, s6
	v_add_co_ci_u32_e32 v16, vcc_lo, s7, v1, vcc_lo
	s_add_u32 s6, s6, 1
	s_addc_u32 s7, s7, 0
	v_cmp_ne_u32_e32 vcc_lo, s6, v14
	global_load_ubyte v15, v[15:16], off
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v26, 0xffff, v15
	v_lshlrev_b64 v[15:16], s4, v[26:27]
	s_add_u32 s4, s4, 8
	s_addc_u32 s5, s5, 0
	v_or_b32_e32 v12, v15, v12
	v_or_b32_e32 v13, v16, v13
	s_cbranch_vccnz .LBB1_36
.LBB1_37:                               ;   in Loop: Header=BB1_4 Depth=1
	v_mov_b32_e32 v16, 0
	s_cbranch_execz .LBB1_39
	s_branch .LBB1_40
.LBB1_38:                               ;   in Loop: Header=BB1_4 Depth=1
                                        ; implicit-def: $vgpr12_vgpr13
	v_mov_b32_e32 v16, 0
.LBB1_39:                               ;   in Loop: Header=BB1_4 Depth=1
	s_clause 0x5
	global_load_ubyte v12, v[0:1], off offset:2
	global_load_ubyte v15, v[0:1], off offset:3
	global_load_ubyte v17, v[0:1], off offset:1
	global_load_ubyte v18, v[0:1], off offset:5
	global_load_ubyte v19, v[0:1], off offset:4
	global_load_ubyte v20, v[0:1], off
	v_mov_b32_e32 v21, v27
	s_clause 0x1
	global_load_ubyte v22, v[0:1], off offset:7
	global_load_ubyte_d16_hi v21, v[0:1], off offset:6
	v_add_co_u32 v0, vcc_lo, v0, 8
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v26, 0xffff, v12
	v_lshlrev_b64 v[12:13], 16, v[26:27]
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v26, 0xffff, v15
	v_lshlrev_b64 v[15:16], 24, v[26:27]
	v_or_b32_e32 v13, v13, v16
	s_waitcnt vmcnt(5)
	v_lshlrev_b16 v16, 8, v17
	s_waitcnt vmcnt(4)
	v_lshlrev_b32_e32 v17, 8, v18
	s_waitcnt vmcnt(3)
	v_or_b32_e32 v13, v13, v19
	s_waitcnt vmcnt(2)
	v_or_b32_e32 v16, v16, v20
	v_or_b32_e32 v13, v13, v17
	s_waitcnt vmcnt(1)
	v_lshlrev_b32_e32 v17, 24, v22
	v_or_b32_sdwa v12, v16, v12 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	v_add_nc_u32_e32 v16, -8, v14
	s_waitcnt vmcnt(0)
	v_or_b32_e32 v13, v13, v21
	v_or_b32_e32 v12, v12, v15
	v_or_b32_e32 v13, v13, v17
.LBB1_40:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_lt_u32_e32 vcc_lo, 7, v16
	s_cbranch_vccnz .LBB1_45
; %bb.41:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_eq_u32_e32 vcc_lo, 0, v16
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	s_mov_b64 s[4:5], 0
	s_cbranch_vccnz .LBB1_44
; %bb.42:                               ;   in Loop: Header=BB1_4 Depth=1
	s_mov_b64 s[6:7], 0
	.p2align	6
.LBB1_43:                               ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	v_add_co_u32 v17, vcc_lo, v0, s6
	v_add_co_ci_u32_e32 v18, vcc_lo, s7, v1, vcc_lo
	s_add_u32 s6, s6, 1
	s_addc_u32 s7, s7, 0
	v_cmp_ne_u32_e32 vcc_lo, s6, v16
	global_load_ubyte v17, v[17:18], off
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v26, 0xffff, v17
	v_lshlrev_b64 v[17:18], s4, v[26:27]
	s_add_u32 s4, s4, 8
	s_addc_u32 s5, s5, 0
	v_or_b32_e32 v14, v17, v14
	v_or_b32_e32 v15, v18, v15
	s_cbranch_vccnz .LBB1_43
.LBB1_44:                               ;   in Loop: Header=BB1_4 Depth=1
	v_mov_b32_e32 v20, 0
	s_cbranch_execz .LBB1_46
	s_branch .LBB1_47
.LBB1_45:                               ;   in Loop: Header=BB1_4 Depth=1
                                        ; implicit-def: $vgpr14_vgpr15
	v_mov_b32_e32 v20, 0
.LBB1_46:                               ;   in Loop: Header=BB1_4 Depth=1
	s_clause 0x5
	global_load_ubyte v14, v[0:1], off offset:2
	global_load_ubyte v17, v[0:1], off offset:3
	global_load_ubyte v19, v[0:1], off offset:1
	global_load_ubyte v20, v[0:1], off offset:5
	global_load_ubyte v21, v[0:1], off offset:4
	global_load_ubyte v22, v[0:1], off
	v_mov_b32_e32 v23, v27
	s_clause 0x1
	global_load_ubyte v30, v[0:1], off offset:7
	global_load_ubyte_d16_hi v23, v[0:1], off offset:6
	v_add_co_u32 v0, vcc_lo, v0, 8
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	s_waitcnt vmcnt(7)
	v_and_b32_e32 v26, 0xffff, v14
	v_lshlrev_b64 v[14:15], 16, v[26:27]
	s_waitcnt vmcnt(6)
	v_and_b32_e32 v26, 0xffff, v17
	v_lshlrev_b64 v[17:18], 24, v[26:27]
	v_or_b32_e32 v15, v15, v18
	s_waitcnt vmcnt(5)
	v_lshlrev_b16 v18, 8, v19
	s_waitcnt vmcnt(4)
	v_lshlrev_b32_e32 v19, 8, v20
	v_add_nc_u32_e32 v20, -8, v16
	s_waitcnt vmcnt(3)
	v_or_b32_e32 v15, v15, v21
	s_waitcnt vmcnt(2)
	v_or_b32_e32 v18, v18, v22
	v_or_b32_e32 v15, v15, v19
	s_waitcnt vmcnt(1)
	v_lshlrev_b32_e32 v19, 24, v30
	v_or_b32_sdwa v14, v18, v14 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
	s_waitcnt vmcnt(0)
	v_or_b32_e32 v15, v15, v23
	v_or_b32_e32 v14, v14, v17
	v_or_b32_e32 v15, v15, v19
.LBB1_47:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_lt_u32_e32 vcc_lo, 7, v20
	s_cbranch_vccnz .LBB1_52
; %bb.48:                               ;   in Loop: Header=BB1_4 Depth=1
	v_cmp_eq_u32_e32 vcc_lo, 0, v20
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_mov_b64 s[4:5], 0
	s_cbranch_vccnz .LBB1_51
; %bb.49:                               ;   in Loop: Header=BB1_4 Depth=1
	v_mov_b32_e32 v19, v1
	v_mov_b32_e32 v18, v0
	.p2align	6
.LBB1_50:                               ;   Parent Loop BB1_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	global_load_ubyte v21, v[18:19], off
	v_add_nc_u32_e32 v20, -1, v20
	v_add_co_u32 v18, vcc_lo, v18, 1
	v_add_co_ci_u32_e32 v19, vcc_lo, 0, v19, vcc_lo
	v_cmp_ne_u32_e32 vcc_lo, 0, v20
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v26, 0xffff, v21
	v_lshlrev_b64 v[21:22], s4, v[26:27]
	s_add_u32 s4, s4, 8
	s_addc_u32 s5, s5, 0
	v_or_b32_e32 v16, v21, v16
	v_or_b32_e32 v17, v22, v17
	s_cbranch_vccnz .LBB1_50
.LBB1_51:                               ;   in Loop: Header=BB1_4 Depth=1
	s_cbranch_execnz .LBB1_3
	s_branch .LBB1_2
.LBB1_52:                               ;   in Loop: Header=BB1_4 Depth=1
                                        ; implicit-def: $vgpr16_vgpr17
	s_branch .LBB1_2
.LBB1_53:
	s_and_b32 vcc_lo, exec_lo, s6
	s_cbranch_vccz .LBB1_56
; %bb.54:
	v_and_or_b32 v2, 0xffffff1d, v25, 34
	v_mov_b32_e32 v0, s28
	v_mov_b32_e32 v1, s29
	v_mov_b32_e32 v3, v24
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v17, 0
	s_mov_b64 s[4:5], s[22:23]
	s_mov_b64 s[6:7], s[20:21]
	s_mov_b64 s[8:9], s[18:19]
	s_mov_b64 s[10:11], s[16:17]
	s_mov_b32 s14, s24
	s_swappc_b64 s[30:31], s[26:27]
	s_endpgm
.LBB1_55:
.LBB1_56:
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z10helloWorldv
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 160
		.amdhsa_kernarg_size 56
		.amdhsa_user_sgpr_count 14
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 1
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 1
		.amdhsa_user_sgpr_flat_scratch_init 1
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_wavefront_size32 1
		.amdhsa_system_sgpr_private_segment_wavefront_offset 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 1
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 2
		.amdhsa_next_free_vgpr 36
		.amdhsa_next_free_sgpr 33
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_workgroup_processor_mode 1
		.amdhsa_memory_ordered 1
		.amdhsa_forward_progress 0
		.amdhsa_shared_vgpr_count 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end0:
	.size	_Z10helloWorldv, .Lfunc_end0-_Z10helloWorldv
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 2932
; NumSgprs: 35
; NumVgprs: 36
; ScratchSize: 160
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 4
; VGPRBlocks: 4
; NumSGPRsForWavesPerEU: 35
; NumVGPRsForWavesPerEU: 36
; Occupancy: 16
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 14
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
	.text
	.p2align	2                               ; -- Begin function __ockl_hostcall_internal
	.type	__ockl_hostcall_internal,@function
__ockl_hostcall_internal:               ; @__ockl_hostcall_internal
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0x0
	buffer_store_dword v1, off, s[0:3], s32 offset:4
	buffer_store_dword v0, off, s[0:3], s32
	v_mov_b32_e32 v0, 2
	buffer_store_dword v0, off, s[0:3], s32 offset:8
	buffer_store_dword v3, off, s[0:3], s32 offset:20
	buffer_store_dword v2, off, s[0:3], s32 offset:16
	buffer_store_dword v5, off, s[0:3], s32 offset:28
	buffer_store_dword v4, off, s[0:3], s32 offset:24
	buffer_store_dword v7, off, s[0:3], s32 offset:36
	buffer_store_dword v6, off, s[0:3], s32 offset:32
	buffer_store_dword v9, off, s[0:3], s32 offset:44
	buffer_store_dword v8, off, s[0:3], s32 offset:40
	buffer_store_dword v11, off, s[0:3], s32 offset:52
	buffer_store_dword v10, off, s[0:3], s32 offset:48
	buffer_store_dword v13, off, s[0:3], s32 offset:60
	buffer_store_dword v12, off, s[0:3], s32 offset:56
	buffer_store_dword v15, off, s[0:3], s32 offset:68
	buffer_store_dword v14, off, s[0:3], s32 offset:64
	buffer_store_dword v17, off, s[0:3], s32 offset:76
	buffer_store_dword v16, off, s[0:3], s32 offset:72
	s_mov_b32 s4, 0
	s_mov_b32 s5, -1
	v_mbcnt_lo_u32_b32 v0, s5, s4
	buffer_store_dword v0, off, s[0:3], s32 offset:80
	buffer_load_dword v0, off, s[0:3], s32 offset:80
	s_waitcnt vmcnt(0)
	;;#ASMSTART
	; ockl readfirstlane hoisting hack v0
	;;#ASMEND
	buffer_store_dword v0, off, s[0:3], s32 offset:80
	buffer_load_dword v0, off, s[0:3], s32 offset:80
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s4, v0
	v_mov_b32_e32 v0, s4
	buffer_store_dword v0, off, s[0:3], s32 offset:84
	buffer_load_dword v0, off, s[0:3], s32
	buffer_load_dword v1, off, s[0:3], s32 offset:4
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[0:3], s32 offset:92
	buffer_store_dword v0, off, s[0:3], s32 offset:88
	buffer_load_dword v0, off, s[0:3], s32 offset:80
	buffer_load_dword v1, off, s[0:3], s32 offset:84
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e64 s6, v0, v1
	s_mov_b64 s[4:5], 0
	v_mov_b32_e32 v7, s5
	v_mov_b32_e32 v6, s4
	s_mov_b32 s4, exec_lo
	s_and_b32 s5, s4, s6
	s_mov_b32 exec_lo, s5
	s_cbranch_execz .LBB0_6
; %bb.1:
	buffer_load_dword v0, off, s[0:3], s32 offset:88
	buffer_load_dword v1, off, s[0:3], s32 offset:92
	s_mov_b64 s[6:7], 24
	s_waitcnt vmcnt(1)
	v_add_co_u32 v2, s5, v0, s6
	s_waitcnt vmcnt(0)
	v_add_co_ci_u32_e64 v3, s5, v1, s7, s5
	global_load_dwordx2 v[8:9], v[0:1], off offset:24 glc dlc
	s_waitcnt vmcnt(0)
	buffer_gl0_inv
	buffer_gl1_inv
	s_mov_b64 s[6:7], 40
	v_add_co_u32 v4, s5, v0, s6
	v_add_co_ci_u32_e64 v5, s5, v1, s7, s5
	global_load_dwordx2 v[6:7], v[0:1], off
	global_load_dwordx2 v[10:11], v[0:1], off offset:40
	s_waitcnt vmcnt(0)
	v_and_b32_e64 v11, v11, v9
	v_and_b32_e64 v10, v10, v8
	s_mov_b32 s5, 24
	v_mad_u64_u32 v[12:13], s6, v10, s5, 0
	s_mov_b32 s6, 32
	v_lshrrev_b64 v[10:11], s6, v[10:11]
	v_mad_u64_u32 v[10:11], s5, v10, s5, v[13:14]
	v_lshlrev_b64 v[10:11], s6, v[10:11]
	s_mov_b32 s5, 0
	v_mov_b32_e32 v13, 0
	v_or_b32_e64 v11, v13, v11
	v_or_b32_e64 v10, v12, v10
	v_add_co_u32 v6, s5, v6, v10
	v_add_co_ci_u32_e64 v7, s5, v7, v11, s5
	global_load_dwordx2 v[6:7], v[6:7], off glc dlc
	s_waitcnt vmcnt(0)
	global_atomic_cmpswap_x2 v[6:7], v[0:1], v[6:9], off offset:24 glc
	s_waitcnt vmcnt(0)
	buffer_gl0_inv
	buffer_gl1_inv
	v_cmp_eq_u64_e64 s6, v[6:7], v[8:9]
	v_cmp_ne_u64_e64 s7, v[6:7], v[8:9]
	s_mov_b32 s5, exec_lo
	s_and_b32 s7, s5, s7
	s_mov_b32 exec_lo, s7
; %bb.2:
	s_mov_b32 s7, 0
                                        ; implicit-def: $sgpr8
	s_branch .LBB0_4
.LBB0_3:
	s_or_b32 exec_lo, exec_lo, s5
                                        ; implicit-def: $sgpr5
	s_branch .LBB0_7
.LBB0_4:                                ; =>This Inner Loop Header: Depth=1
                                        ; implicit-def: $sgpr9
	s_sleep 1
	global_load_dwordx2 v[10:11], v[0:1], off
	global_load_dwordx2 v[12:13], v[4:5], off
	v_mov_b32_e32 v9, v7
	v_mov_b32_e32 v8, v6
	s_waitcnt vmcnt(0)
	v_and_b32_e64 v7, v13, v9
	v_and_b32_e64 v6, v12, v8
	s_mov_b32 s9, 24
	v_mad_u64_u32 v[12:13], s10, v6, s9, 0
	s_mov_b32 s10, 32
	v_lshrrev_b64 v[6:7], s10, v[6:7]
	v_mad_u64_u32 v[6:7], s9, v6, s9, v[13:14]
	v_lshlrev_b64 v[6:7], s10, v[6:7]
	s_mov_b32 s9, 0
	v_mov_b32_e32 v13, 0
	v_or_b32_e64 v7, v13, v7
	v_or_b32_e64 v6, v12, v6
	v_add_co_u32 v6, s9, v10, v6
	v_add_co_ci_u32_e64 v7, s9, v11, v7, s9
	global_load_dwordx2 v[6:7], v[6:7], off glc dlc
	s_waitcnt vmcnt(0)
	global_atomic_cmpswap_x2 v[6:7], v[2:3], v[6:9], off glc
	s_waitcnt vmcnt(0)
	buffer_gl0_inv
	buffer_gl1_inv
	v_cmp_eq_u64_e64 s9, v[6:7], v[8:9]
	s_or_b32 s7, s9, s7
	s_andn2_b32 s8, s8, exec_lo
	s_and_b32 s9, s9, exec_lo
	s_or_b32 s8, s8, s9
	s_andn2_b32 exec_lo, exec_lo, s7
	s_cbranch_execnz .LBB0_4
; %bb.5:
	s_or_b32 exec_lo, exec_lo, s7
	s_andn2_b32 s6, s6, exec_lo
	s_and_b32 s7, s8, exec_lo
	s_or_b32 s6, s6, s7
	s_branch .LBB0_3
.LBB0_6:
	s_or_b32 exec_lo, exec_lo, s4
	s_branch .LBB0_8
.LBB0_7:
	s_branch .LBB0_6
.LBB0_8:
	s_mov_b32 s8, 32
	v_lshrrev_b64 v[0:1], s8, v[6:7]
	v_readfirstlane_b32 s4, v6
	v_readfirstlane_b32 s6, v0
	s_lshl_b64 s[6:7], s[6:7], s8
	s_mov_b32 s5, 0
	s_or_b64 s[6:7], s[6:7], s[4:5]
	v_mov_b32_e32 v0, s7
	buffer_store_dword v0, off, s[0:3], s32 offset:100
	v_mov_b32_e32 v0, s6
	buffer_store_dword v0, off, s[0:3], s32 offset:96
	buffer_load_dword v0, off, s[0:3], s32 offset:88
	buffer_load_dword v1, off, s[0:3], s32 offset:92
	buffer_load_dword v2, off, s[0:3], s32 offset:96
	buffer_load_dword v3, off, s[0:3], s32 offset:100
	s_waitcnt vmcnt(2)
	global_load_dwordx2 v[4:5], v[0:1], off
	global_load_dwordx2 v[0:1], v[0:1], off offset:40
	s_waitcnt vmcnt(0)
	v_and_b32_e64 v1, v3, v1
	v_and_b32_e64 v0, v2, v0
	s_mov_b32 s4, 24
	v_mad_u64_u32 v[2:3], s6, v0, s4, 0
	v_lshrrev_b64 v[0:1], s8, v[0:1]
	v_mad_u64_u32 v[0:1], s4, v0, s4, v[3:4]
	v_lshlrev_b64 v[0:1], s8, v[0:1]
	v_mov_b32_e32 v3, s5
	v_or_b32_e64 v1, v3, v1
	v_or_b32_e64 v0, v2, v0
	v_add_co_u32 v0, s4, v4, v0
	v_add_co_ci_u32_e64 v1, s4, v5, v1, s4
	buffer_store_dword v1, off, s[0:3], s32 offset:108
	buffer_store_dword v0, off, s[0:3], s32 offset:104
	buffer_load_dword v0, off, s[0:3], s32 offset:88
	buffer_load_dword v1, off, s[0:3], s32 offset:92
	buffer_load_dword v2, off, s[0:3], s32 offset:96
	buffer_load_dword v3, off, s[0:3], s32 offset:100
	s_waitcnt vmcnt(2)
	global_load_dwordx2 v[4:5], v[0:1], off offset:8
	global_load_dwordx2 v[0:1], v[0:1], off offset:40
	s_waitcnt vmcnt(0)
	v_and_b32_e64 v1, v3, v1
	v_and_b32_e64 v0, v2, v0
	s_mov_b32 s4, 12
	v_lshlrev_b64 v[0:1], s4, v[0:1]
	v_add_co_u32 v0, s4, v4, v0
	v_add_co_ci_u32_e64 v1, s4, v5, v1, s4
	buffer_store_dword v1, off, s[0:3], s32 offset:116
	buffer_store_dword v0, off, s[0:3], s32 offset:112
	buffer_load_dword v0, off, s[0:3], s32 offset:112
	buffer_load_dword v1, off, s[0:3], s32 offset:116
	buffer_load_dword v2, off, s[0:3], s32 offset:16
	buffer_load_dword v3, off, s[0:3], s32 offset:20
	buffer_load_dword v4, off, s[0:3], s32 offset:24
	buffer_load_dword v5, off, s[0:3], s32 offset:28
	buffer_load_dword v6, off, s[0:3], s32 offset:32
	buffer_load_dword v7, off, s[0:3], s32 offset:36
	buffer_load_dword v8, off, s[0:3], s32 offset:40
	buffer_load_dword v9, off, s[0:3], s32 offset:44
	buffer_load_dword v10, off, s[0:3], s32 offset:48
	buffer_load_dword v11, off, s[0:3], s32 offset:52
	buffer_load_dword v12, off, s[0:3], s32 offset:56
	buffer_load_dword v13, off, s[0:3], s32 offset:60
	buffer_load_dword v14, off, s[0:3], s32 offset:64
	buffer_load_dword v15, off, s[0:3], s32 offset:68
	buffer_load_dword v16, off, s[0:3], s32 offset:72
	buffer_load_dword v17, off, s[0:3], s32 offset:76
	buffer_load_dword v18, off, s[0:3], s32 offset:80
	buffer_load_dword v19, off, s[0:3], s32 offset:84
	s_mov_b64 s[4:5], exec
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e64 s7, v18, v19
	s_mov_b32 s6, exec_lo
	s_and_b32 s7, s6, s7
	s_mov_b32 exec_lo, s7
	s_cbranch_execz .LBB0_10
; %bb.9:
	buffer_load_dword v19, off, s[0:3], s32 offset:104
	buffer_load_dword v20, off, s[0:3], s32 offset:108
	buffer_load_dword v21, off, s[0:3], s32 offset:8
	s_waitcnt vmcnt(0)
	global_store_dword v[19:20], v21, off offset:16
	v_mov_b32_e32 v22, s5
	v_mov_b32_e32 v21, s4
	global_store_dwordx2 v[19:20], v[21:22], off offset:8
	v_mov_b32_e32 v21, 1
	global_store_dword v[19:20], v21, off offset:20
.LBB0_10:
	s_or_b32 exec_lo, exec_lo, s6
	s_mov_b32 s4, 0
	v_mov_b32_e32 v19, 0
	s_mov_b32 s4, 6
	v_lshlrev_b64 v[18:19], s4, v[18:19]
	v_add_co_u32 v0, s4, v0, v18
	v_add_co_ci_u32_e64 v1, s4, v1, v19, s4
	global_store_dwordx2 v[0:1], v[2:3], off
	global_store_dwordx2 v[0:1], v[4:5], off offset:8
	global_store_dwordx2 v[0:1], v[6:7], off offset:16
	global_store_dwordx2 v[0:1], v[8:9], off offset:24
	global_store_dwordx2 v[0:1], v[10:11], off offset:32
	global_store_dwordx2 v[0:1], v[12:13], off offset:40
	global_store_dwordx2 v[0:1], v[14:15], off offset:48
	global_store_dwordx2 v[0:1], v[16:17], off offset:56
	buffer_load_dword v0, off, s[0:3], s32 offset:80
	buffer_load_dword v1, off, s[0:3], s32 offset:84
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e64 s5, v0, v1
	s_mov_b32 s4, exec_lo
	s_and_b32 s5, s4, s5
	s_mov_b32 exec_lo, s5
	s_cbranch_execz .LBB0_17
; %bb.11:
	buffer_load_dword v4, off, s[0:3], s32 offset:88
	buffer_load_dword v5, off, s[0:3], s32 offset:92
	buffer_load_dword v0, off, s[0:3], s32 offset:96
	buffer_load_dword v1, off, s[0:3], s32 offset:100
	s_mov_b64 s[6:7], 32
	s_waitcnt vmcnt(3)
	v_add_co_u32 v6, s5, v4, s6
	s_waitcnt vmcnt(2)
	v_add_co_ci_u32_e64 v7, s5, v5, s7, s5
	global_load_dwordx2 v[10:11], v[4:5], off offset:32 glc dlc
	global_load_dwordx2 v[2:3], v[4:5], off
	global_load_dwordx2 v[8:9], v[4:5], off offset:40
	s_waitcnt vmcnt(0)
	v_and_b32_e64 v9, v9, v1
	v_and_b32_e64 v8, v8, v0
	s_mov_b32 s5, 24
	v_mad_u64_u32 v[12:13], s6, v8, s5, 0
	s_mov_b32 s6, 32
	v_lshrrev_b64 v[8:9], s6, v[8:9]
	v_mad_u64_u32 v[8:9], s5, v8, s5, v[13:14]
	v_lshlrev_b64 v[8:9], s6, v[8:9]
	s_mov_b32 s5, 0
	v_mov_b32_e32 v13, 0
	v_or_b32_e64 v9, v13, v9
	v_or_b32_e64 v8, v12, v8
	v_add_co_u32 v8, s5, v2, v8
	v_add_co_ci_u32_e64 v9, s5, v3, v9, s5
	global_store_dwordx2 v[8:9], v[10:11], off
	v_mov_b32_e32 v2, v10
	v_mov_b32_e32 v3, v11
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	global_atomic_cmpswap_x2 v[2:3], v[4:5], v[0:3], off offset:32 glc
	s_waitcnt vmcnt(0)
	v_cmp_eq_u64_e64 s5, v[2:3], v[10:11]
	v_cmp_ne_u64_e64 s6, v[2:3], v[10:11]
	s_mov_b32 s5, exec_lo
	s_and_b32 s6, s5, s6
	s_mov_b32 exec_lo, s6
	s_cbranch_execz .LBB0_14
; %bb.12:
	s_mov_b32 s6, 0
.LBB0_13:                               ; =>This Inner Loop Header: Depth=1
                                        ; implicit-def: $sgpr7
	s_sleep 1
	global_store_dwordx2 v[8:9], v[2:3], off
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	global_atomic_cmpswap_x2 v[10:11], v[6:7], v[0:3], off glc
	s_waitcnt vmcnt(0)
	v_cmp_eq_u64_e64 s7, v[10:11], v[2:3]
	s_or_b32 s6, s7, s6
	v_mov_b32_e32 v2, v10
	v_mov_b32_e32 v3, v11
	s_andn2_b32 exec_lo, exec_lo, s6
	s_cbranch_execnz .LBB0_13
.LBB0_14:
	s_or_b32 exec_lo, exec_lo, s5
; %bb.15:
	global_load_dwordx2 v[2:3], v[4:5], off offset:16
	s_mov_b64 s[6:7], 1
	v_mov_b32_e32 v0, s6
	v_mov_b32_e32 v1, s7
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	global_atomic_add_x2 v[2:3], v[0:1], off offset:8
	global_load_dwordx2 v[0:1], v[2:3], off offset:16
	s_mov_b64 s[6:7], 0
	s_waitcnt vmcnt(0)
	v_cmp_ne_u64_e64 s5, v[0:1], s[6:7]
	s_mov_b32 s6, exec_lo
	s_and_b32 s5, s6, s5
	s_mov_b32 exec_lo, s5
	s_cbranch_execz .LBB0_17
; %bb.16:
	global_load_dword v2, v[2:3], off offset:24
	s_mov_b32 s5, 0
	v_mov_b32_e32 v3, 0
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	global_store_dwordx2 v[0:1], v[2:3], off
	v_readfirstlane_b32 s5, v2
	s_mov_b32 s6, 0xff
	s_and_b32 m0, s5, s6
	s_sendmsg sendmsg(MSG_INTERRUPT)
.LBB0_17:
	s_or_b32 exec_lo, exec_lo, s4
; %bb.18:
	buffer_load_dword v3, off, s[0:3], s32 offset:104
	buffer_load_dword v4, off, s[0:3], s32 offset:108
	buffer_load_dword v0, off, s[0:3], s32 offset:112
	buffer_load_dword v1, off, s[0:3], s32 offset:116
	buffer_load_dword v2, off, s[0:3], s32 offset:80
	buffer_load_dword v5, off, s[0:3], s32 offset:84
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e64 s4, v2, v5
	s_mov_b64 s[6:7], 20
	v_add_co_u32 v3, s5, v3, s6
	v_add_co_ci_u32_e64 v4, s5, v4, s7, s5
.LBB0_19:                               ; =>This Inner Loop Header: Depth=1
	s_mov_b32 s5, 1
	v_mov_b32_e32 v5, 1
	s_mov_b32 s5, exec_lo
	s_and_b32 s6, s5, s4
	s_mov_b32 exec_lo, s6
	s_cbranch_execz .LBB0_21
; %bb.20:                               ;   in Loop: Header=BB0_19 Depth=1
	global_load_dword v5, v[3:4], off glc dlc
	s_waitcnt vmcnt(0)
	buffer_gl0_inv
	buffer_gl1_inv
	s_mov_b32 s6, 1
	v_and_b32_e64 v5, v5, s6
.LBB0_21:                               ;   in Loop: Header=BB0_19 Depth=1
	s_or_b32 exec_lo, exec_lo, s5
	v_readfirstlane_b32 s6, v5
	s_mov_b32 s5, -1
	s_mov_b32 s7, 0
	s_cmp_eq_u32 s6, s7
	s_cselect_b32 s6, -1, 0
	s_and_b32 vcc_lo, exec_lo, s6
	s_cbranch_vccnz .LBB0_23
; %bb.22:                               ;   in Loop: Header=BB0_19 Depth=1
	s_sleep 1
	s_mov_b32 s5, 0
.LBB0_23:                               ;   in Loop: Header=BB0_19 Depth=1
	v_cndmask_b32_e64 v5, 0, 1, s5
	s_mov_b32 s5, 1
	v_cmp_ne_u32_e64 s5, v5, s5
	s_and_b32 vcc_lo, exec_lo, s5
	s_cbranch_vccnz .LBB0_19
; %bb.24:
	s_mov_b32 s4, 0
	v_mov_b32_e32 v3, 0
	s_mov_b32 s4, 6
	v_lshlrev_b64 v[2:3], s4, v[2:3]
	v_add_co_u32 v0, s4, v0, v2
	v_add_co_ci_u32_e64 v1, s4, v1, v3, s4
	global_load_dwordx2 v[2:3], v[0:1], off
	global_load_dwordx2 v[0:1], v[0:1], off offset:8
	s_waitcnt vmcnt(0)
	buffer_store_dword v1, off, s[0:3], s32 offset:140
	buffer_store_dword v0, off, s[0:3], s32 offset:136
	buffer_store_dword v3, off, s[0:3], s32 offset:132
	buffer_store_dword v2, off, s[0:3], s32 offset:128
	buffer_load_dword v0, off, s[0:3], s32 offset:80
	buffer_load_dword v1, off, s[0:3], s32 offset:84
	s_waitcnt vmcnt(0)
	v_cmp_eq_u32_e64 s5, v0, v1
	s_mov_b32 s4, exec_lo
	s_and_b32 s5, s4, s5
	s_mov_b32 exec_lo, s5
	s_cbranch_execz .LBB0_28
; %bb.25:
	buffer_load_dword v8, off, s[0:3], s32 offset:88
	buffer_load_dword v9, off, s[0:3], s32 offset:92
	buffer_load_dword v0, off, s[0:3], s32 offset:96
	buffer_load_dword v1, off, s[0:3], s32 offset:100
	s_waitcnt vmcnt(2)
	global_load_dwordx2 v[2:3], v[8:9], off offset:40
	s_mov_b64 s[6:7], 1
	s_waitcnt vmcnt(0)
	v_add_co_u32 v4, s5, v2, s6
	v_add_co_ci_u32_e64 v5, s5, v3, s7, s5
	v_add_co_u32 v0, s5, v4, v0
	v_add_co_ci_u32_e64 v1, s5, v5, v1, s5
	s_mov_b64 s[6:7], 0
	v_cmp_eq_u64_e64 s5, v[0:1], s[6:7]
	v_cndmask_b32_e64 v1, v1, v5, s5
	v_cndmask_b32_e64 v0, v0, v4, s5
	s_mov_b64 s[6:7], 24
	v_add_co_u32 v4, s5, v8, s6
	v_add_co_ci_u32_e64 v5, s5, v9, s7, s5
	global_load_dwordx2 v[10:11], v[8:9], off offset:24 glc dlc
	global_load_dwordx2 v[6:7], v[8:9], off
	v_and_b32_e64 v3, v1, v3
	v_and_b32_e64 v2, v0, v2
	s_mov_b32 s5, 24
	v_mad_u64_u32 v[12:13], s6, v2, s5, 0
	s_mov_b32 s6, 32
	v_lshrrev_b64 v[2:3], s6, v[2:3]
	v_mad_u64_u32 v[2:3], s5, v2, s5, v[13:14]
	v_lshlrev_b64 v[2:3], s6, v[2:3]
	s_mov_b32 s5, 0
	v_mov_b32_e32 v13, 0
	v_or_b32_e64 v3, v13, v3
	v_or_b32_e64 v2, v12, v2
	s_waitcnt vmcnt(0)
	v_add_co_u32 v6, s5, v6, v2
	v_add_co_ci_u32_e64 v7, s5, v7, v3, s5
	global_store_dwordx2 v[6:7], v[10:11], off
	v_mov_b32_e32 v2, v10
	v_mov_b32_e32 v3, v11
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	global_atomic_cmpswap_x2 v[2:3], v[8:9], v[0:3], off offset:24 glc
	s_waitcnt vmcnt(0)
	v_cmp_eq_u64_e64 s5, v[2:3], v[10:11]
	v_cmp_ne_u64_e64 s5, v[2:3], v[10:11]
	s_mov_b32 s6, exec_lo
	s_and_b32 s5, s6, s5
	s_mov_b32 exec_lo, s5
	s_cbranch_execz .LBB0_28
; %bb.26:
	s_mov_b32 s5, 0
.LBB0_27:                               ; =>This Inner Loop Header: Depth=1
                                        ; implicit-def: $sgpr6
	s_sleep 1
	global_store_dwordx2 v[6:7], v[2:3], off
	s_waitcnt vmcnt(0)
	s_waitcnt_vscnt null, 0x0
	global_atomic_cmpswap_x2 v[8:9], v[4:5], v[0:3], off glc
	s_waitcnt vmcnt(0)
	v_cmp_eq_u64_e64 s6, v[8:9], v[2:3]
	s_or_b32 s5, s6, s5
	v_mov_b32_e32 v2, v8
	v_mov_b32_e32 v3, v9
	s_andn2_b32 exec_lo, exec_lo, s5
	s_cbranch_execnz .LBB0_27
.LBB0_28:
	s_or_b32 exec_lo, exec_lo, s4
	buffer_load_dword v0, off, s[0:3], s32 offset:128
	buffer_load_dword v1, off, s[0:3], s32 offset:132
	buffer_load_dword v2, off, s[0:3], s32 offset:136
	buffer_load_dword v3, off, s[0:3], s32 offset:140
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_waitcnt_vscnt null, 0x0
	s_setpc_b64 s[30:31]
.Lfunc_end1:
	.size	__ockl_hostcall_internal, .Lfunc_end1-__ockl_hostcall_internal
                                        ; -- End function
	.section	.AMDGPU.csdata
; Function info:
; codeLenInByte = 3016
; NumSgprs: 35
; NumVgprs: 23
; ScratchSize: 160
; MemoryBound: 0
	.text
	.p2alignl 6, 3214868480
	.fill 48, 4, 3214868480
	.type	.str,@object                    ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.str:
	.asciz	"Hello HIP world \n"
	.size	.str, 18

	.ident	"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.3.0 22362 3cf23f77f8208174a2ee7c616f4be23674d7b081)"
	.section	".note.GNU-stack"
	.addrsig
	.amdgpu_metadata
---
amdhsa.kernels:
  - .args:
      - .offset:         0
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         8
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         16
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .address_space:  global
        .offset:         24
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .address_space:  global
        .offset:         32
        .size:           8
        .value_kind:     hidden_none
      - .address_space:  global
        .offset:         40
        .size:           8
        .value_kind:     hidden_none
      - .address_space:  global
        .offset:         48
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 56
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z10helloWorldv
    .private_segment_fixed_size: 160
    .sgpr_count:     35
    .sgpr_spill_count: 0
    .symbol:         _Z10helloWorldv.kd
    .vgpr_count:     36
    .vgpr_spill_count: 0
    .wavefront_size: 32
amdhsa.target:   amdgcn-amd-amdhsa--gfx1030
amdhsa.version:
  - 1
  - 1
...

	.end_amdgpu_metadata

# __CLANG_OFFLOAD_BUNDLE____END__ hip-amdgcn-amd-amdhsa-gfx1030

# __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
	.text
	.file	"01-Hello.hip"
	.globl	_Z25__device_stub__helloWorldv  # -- Begin function _Z25__device_stub__helloWorldv
	.p2align	4, 0x90
	.type	_Z25__device_stub__helloWorldv,@function
_Z25__device_stub__helloWorldv:         # @_Z25__device_stub__helloWorldv
	.cfi_startproc
# %bb.0:
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	leaq	32(%rsp), %rdi
	leaq	16(%rsp), %rsi
	leaq	8(%rsp), %rdx
	movq	%rsp, %rcx
	callq	__hipPopCallConfiguration
	movq	32(%rsp), %rsi
	movl	40(%rsp), %edx
	movq	16(%rsp), %rcx
	movl	24(%rsp), %r8d
	leaq	48(%rsp), %r9
	movl	$_Z10helloWorldv, %edi
	pushq	(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	16(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel
	addq	$72, %rsp
	.cfi_adjust_cfa_offset -72
	retq
.Lfunc_end0:
	.size	_Z25__device_stub__helloWorldv, .Lfunc_end0-_Z25__device_stub__helloWorldv
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movabsq	$34359738372, %rdi              # imm = 0x800000004
	movabsq	$8589934596, %rdx               # imm = 0x200000004
	movl	$1, %esi
	movl	$1, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration
	testl	%eax, %eax
	jne	.LBB1_2
# %bb.1:
	leaq	32(%rsp), %rdi
	leaq	16(%rsp), %rsi
	leaq	8(%rsp), %rdx
	movq	%rsp, %rcx
	callq	__hipPopCallConfiguration
	movq	32(%rsp), %rsi
	movl	40(%rsp), %edx
	movq	16(%rsp), %rcx
	movl	24(%rsp), %r8d
	leaq	48(%rsp), %r9
	movl	$_Z10helloWorldv, %edi
	pushq	(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	16(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.LBB1_2:
	callq	hipDeviceSynchronize
	callq	hipDeviceReset
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __hip_module_ctor
	.type	__hip_module_ctor,@function
__hip_module_ctor:                      # @__hip_module_ctor
	.cfi_startproc
# %bb.0:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	__hip_gpubin_handle(%rip), %rdi
	testq	%rdi, %rdi
	jne	.LBB2_2
# %bb.1:
	movl	$__hip_fatbin_wrapper, %edi
	callq	__hipRegisterFatBinary
	movq	%rax, %rdi
	movq	%rax, __hip_gpubin_handle(%rip)
.LBB2_2:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsp)
	movups	%xmm0, (%rsp)
	movl	$_Z10helloWorldv, %esi
	movl	$.L__unnamed_1, %edx
	movl	$.L__unnamed_1, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	__hipRegisterFunction
	movl	$__hip_module_dtor, %edi
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	jmp	atexit                          # TAILCALL
.Lfunc_end2:
	.size	__hip_module_ctor, .Lfunc_end2-__hip_module_ctor
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __hip_module_dtor
	.type	__hip_module_dtor,@function
__hip_module_dtor:                      # @__hip_module_dtor
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__hip_gpubin_handle(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB3_2
# %bb.1:
	callq	__hipUnregisterFatBinary
	movq	$0, __hip_gpubin_handle(%rip)
.LBB3_2:
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	__hip_module_dtor, .Lfunc_end3-__hip_module_dtor
	.cfi_endproc
                                        # -- End function
	.type	_Z10helloWorldv,@object         # @_Z10helloWorldv
	.section	.rodata,"a",@progbits
	.globl	_Z10helloWorldv
	.p2align	3
_Z10helloWorldv:
	.quad	_Z25__device_stub__helloWorldv
	.size	_Z10helloWorldv, 8

	.type	.L__unnamed_1,@object           # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"_Z10helloWorldv"
	.size	.L__unnamed_1, 16

	.type	__hip_fatbin_wrapper,@object    # @__hip_fatbin_wrapper
	.section	.hipFatBinSegment,"a",@progbits
	.p2align	3
__hip_fatbin_wrapper:
	.long	1212764230                      # 0x48495046
	.long	1                               # 0x1
	.quad	__hip_fatbin
	.quad	0
	.size	__hip_fatbin_wrapper, 24

	.hidden	__hip_gpubin_handle             # @__hip_gpubin_handle
	.type	__hip_gpubin_handle,@object
	.section	.bss.__hip_gpubin_handle,"aGw",@nobits,__hip_gpubin_handle,comdat
	.weak	__hip_gpubin_handle
	.p2align	3
__hip_gpubin_handle:
	.quad	0
	.size	__hip_gpubin_handle, 8

	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	__hip_module_ctor
	.ident	"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.3.0 22362 3cf23f77f8208174a2ee7c616f4be23674d7b081)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z25__device_stub__helloWorldv
	.addrsig_sym __hip_module_ctor
	.addrsig_sym __hip_module_dtor
	.addrsig_sym _Z10helloWorldv
	.addrsig_sym __hip_fatbin
	.addrsig_sym __hip_fatbin_wrapper

# __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
