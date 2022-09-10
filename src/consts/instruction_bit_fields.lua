local util = require "src/utility"

local const = util.readOnlyTable {

    ----------------------------
    -- ARM Instruction Fields --
    ----------------------------

    -- Basic ARM Instruction Set Encoding Fields
    ARM_COND_WIDTH = 4,
    ARM_COND_SHIFT = 28,
    ARM_OP1_WIDTH =  3,
    ARM_OP1_SHIFT = 25,
    ARM_OP_WIDTH = 1,
    ARM_OP_SHIFT = 4,

    -- ARM Data Processing (Register) Instruction Fields (Page 195 of the ARM Manual)
    ARM_DPR_OP_WIDTH = 5,
    ARM_DPR_OP_SHIFT = 20,
    ARM_DPR_IMM5_WIDTH = 5,
    ARM_DPR_IMM5_SHIFT = 7,
    ARM_DPR_OP2_WIDTH = 2,
    ARM_DPR_OP2_SHIFT = 5,

    -- ARM Data Processing (Register-shifted Register)
    ARM_DPRSR_OP1_WIDTH = 5,
    ARM_DPRSR_OP1_SHIFT = 20,
    ARM_DPRSR_OP2_WIDTH = 2,
    ARM_DPRSR_OP2_SHIFT = 5,

    -- ARM Data Processing (Immediate)
    ARM_DPI_OP_WIDTH = 5,
    ARM_DPI_OP_SHIFT = 20,
    ARM_DPI_RN_WIDTH = 4,
    ARM_DPI_RN_SHIFT = 16,

    -- ARM Modified Immediate Constants Encoding
    ARM_MIC_ROTATION_WIDTH = 4,
    ARM_MIC_ROTATION_SHIFT = 8,
    ARM_MIC_A_WIDTH = 1,
    ARM_MIC_A_SHIFT = 7,
    ARM_MIC_B_WIDTH = 1,
    ARM_MIC_B_SHIFT = 6,
    ARM_MIC_C_WIDTH = 1,
    ARM_MIC_C_SHIFT = 5,
    ARM_MIC_D_WIDTH = 1,
    ARM_MIC_D_SHIFT = 4,
    ARM_MIC_E_WIDTH = 1,
    ARM_MIC_E_SHIFT = 3,
    ARM_MIC_F_WIDTH = 1,
    ARM_MIC_F_SHIFT = 2,
    ARM_MIC_G_WIDTH = 1,
    ARM_MIC_G_SHIFT = 1,
    ARM_MIC_H_WIDTH = 1,
    ARM_MIC_H_SHIFT = 0,

    -- ARM Multiply and Multiply Accumulate
    ARM_MUL_OP_WIDTH = 4,
    ARM_MUL_OP_SHIFT = 20,

    -- ARM Saturating Addition and Subtraction
    ARM_SADDSUB_OP_WIDTH = 2,
    ARM_SADDSUB_OP_SHIFT = 21,

    -- ARM Halfword Multiply and Multiply Accumulate
    ARM_HWMUL_OP1_WIDTH = 2,
    ARM_HWMUL_OP1_SHIFT = 21,
    ARM_HWMUL_OP_WIDTH = 1,
    ARM_HWMUL_OP_SHIFT = 5,

    -- ARM Extra Load / Store
    ARM_XTRA_LD_STR_OP1_WIDTH = 5,
    ARM_XTRA_LD_STR_OP1_SHIFT = 20,
    ARM_XTRA_LD_STR_RN_WIDTH = 4,
    ARM_XTRA_LD_STR_RN_SHIFT = 16,
    ARM_XTRA_LD_STR_OP2_WIDTH = 2,
    ARM_XTRA_LD_STR_OP2_SHIFT = 5,

    -- ARM Unprivileged Extra Load / Store
    ARM_UNPRIV_XTRA_LD_STR_OP_WIDTH = 1,
    ARM_UNPRIV_XTRA_LD_STR_OP_SHIFT = 20,
    ARM_UNPRIV_XTRA_LD_STR_OP2_WIDTH = 2,
    ARM_UNPRIV_XTRA_LD_STR_OP2_SHIFT = 5,

    -- ARM Synchronization Primitives
    ARM_SYNC_OP_WIDTH = 4,
    ARM_SYNC_OP_SHIFT = 20,

    -- ARM MSR (immediate)
    ARM_MSRI_OP_WIDTH = 1,
    ARM_MSRI_OP_SHIFT = 22,
    ARM_MSRI_OP1_WIDTH = 4,
    ARM_MSRI_OP1_SHIFT = 16,
    ARM_MSRI_OP2_WIDTH = 8,
    ARM_MSRI_OP2_SHIFT = 0,

    -- ARM Misc. Instructions
    ARM_MISC_OP_WIDTH = 2,
    ARM_MISC_OP_SHIFT = 21,
    ARM_MISC_OP1_WIDTH = 4,
    ARM_MISC_OP1_SHIFT = 16,
    ARM_MISC_B_WIDTH = 1,
    ARM_MISC_B_SHIFT = 9,
    ARM_MISC_OP2_WIDTH = 3,
    ARM_MISC_OP2_SHIFT = 4,

    -- ARM Load / Store Word and Unsigned Byte
    ARM_LD_STR_A_WIDTH = 1,
    ARM_LD_STR_A_SHIFT = 25,
    ARM_LD_STR_OP1_WIDTH = 5,
    ARM_LD_STR_OP1_SHIFT = 20,
    ARM_LD_STR_RN_WIDTH = 4,
    ARM_LD_STR_RN_SHIFT = 16,
    ARM_LD_STR_B_WIDTH = 1,
    ARM_LD_STR_B_SHIFT = 4,

    -- ARM Media Instructions
    ARM_MEDIA_OP1_WIDTH = 5,
    ARM_MEDIA_OP1_SHIFT = 20,
    ARM_MEDIA_RD_WIDTH = 4,
    ARM_MEDIA_RD_SHIFT = 12,
    ARM_MEDIA_OP2_WIDTH = 3,
    ARM_MEDIA_OP2_SHIFT = 5,
    ARM_MEDIA_RN_WIDTH = 4,
    ARM_MEDIA_RN_SHIFT = 0,

    -- ARM Parallel Addition and Subtraction, Signed
    ARM_PAR_SADD_SSUB_OP1_WIDTH = 2,
    ARM_PAR_SADD_SSUB_OP1_SHIFT = 20,
    ARM_PAR_SADD_SSUB_OP2_WIDTH = 3,
    ARM_PAR_SADD_SSUB_OP2_SHIFT = 5,

    -- ARM Parallel Addition and Subtraction, Unsigned
    ARM_PAR_UADD_USUB_OP1_WIDTH = 2,
    ARM_PAR_UADD_USUB_OP1_SHIFT = 20,
    ARM_PAR_UADD_USUB_OP2_WIDTH = 3,
    ARM_PAR_UADD_USUB_OP2_SHIFT = 5,

    -- ARM Packing, Unpacking, Saturation, and Reversal
    ARM_PUSR_OP1_WIDTH = 3,
    ARM_PUSR_OP1_SHIFT = 20,
    ARM_PUSR_A_WIDTH = 4,
    ARM_PUSR_A_SHIFT = 16,
    ARM_PUSR_OP2_WIDTH = 3,
    ARM_PUSR_OP2_SHIFT = 5,

    -- ARM Signed Multiply, Signed and Unsigned Divide
    ARM_SMUL_SUDIV_OP1_WIDTH = 3,
    ARM_SMUL_SUDIV_OP1_SHIFT = 20,
    ARM_SMUL_SUDIV_A_WIDTH = 4,
    ARM_SMUL_SUDIV_A_SHIFT = 12,
    ARM_SMUL_SUDIV_OP2_WIDTH = 3,
    ARM_SMUL_SUDIV_OP2_SHIFT = 5,

    -- ARM Branch, Branch w/ Link, Block Data Transfer
    ARM_B_OP_WIDTH = 6,
    ARM_B_OP_SHIFT = 20,
    ARM_B_RN_WIDTH = 4,
    ARM_B_RN_SHIFT = 16,
    ARM_B_R_WIDTH = 1,
    ARM_B_R_SHIFT = 15,

    -- ARM Coprocessor Instruction and Supervisor Call
    ARM_COP_SUP_OP1_WIDTH = 6,
    ARM_COP_SUP_OP1_SHIFT = 20,
    ARM_COP_SUP_RN_WIDTH = 4,
    ARM_COP_SUP_RN_SHIFT = 16,
    ARM_COP_SUP_COPROC_WIDTH = 4,
    ARM_COP_SUP_COPROC_SHIFT = 8,
    ARM_COP_SUP_OP_WIDTH = 1,
    ARM_COP_SUP_OP_SHIFT = 4,

    -- ARM Unconditional Instructions
    ARM_UNCOND_OP1_WIDTH = 8,
    ARM_UNCOND_OP1_SHIFT = 20,
    ARM_UNCOND_RN_WIDTH = 4,
    ARM_UNCOND_RN_SHIFT = 16,
    ARM_UNCOND_OP_WIDTH = 1,
    ARM_UNCOND_OP_SHIFT = 4,

    -- ARM Memory Hints, Advanced SIMD Instructs, and Misc. Instructs (aka MAM)
    ARM_MAM_OP1_WIDTH = 7,
    ARM_MAM_OP1_SHIFT = 20,
    ARM_MAM_RN_WIDTH = 4,
    ARM_MAM_RN_SHIFT = 16,
    ARM_MAM_OP2_WIDTH = 4,
    ARM_MAM_OP2_SHIFT = 4,

     -- ARM Advanced SIMD or Floating Point Register Encoding
    ARM_ADV_SIMD_FP_REG_D_WIDTH = 1,
    ARM_ADV_SIMD_FP_REG_D_SHIFT = 22,
    ARM_ADV_SIMD_FP_REG_VN_WIDTH = 4,
    ARM_ADV_SIMD_FP_REG_VN_SHIFT = 16,
    ARM_ADV_SIMD_FP_REG_VD_WIDTH = 4,
    ARM_ADV_SIMD_FP_REG_VD_SHIFT = 12,
    ARM_ADV_SIMD_FP_REG_SZ_WIDTH = 1,
    ARM_ADV_SIMD_FP_REG_SZ_SHIFT = 8,
    ARM_ADV_SIMD_FP_REG_N_WIDTH = 1,
    ARM_ADV_SIMD_FP_REG_N_SHIFT = 7,
    ARM_ADV_SIMD_FP_REG_Q_WIDTH = 1,
    ARM_ADV_SIMD_FP_REG_Q_SHIFT = 6,
    ARM_ADV_SIMD_FP_REG_M_WIDTH = 1,
    ARM_ADV_SIMD_FP_REG_M_SHIFT = 5,
    ARM_ADV_SIMD_FP_REG_VM_WIDTH = 4,
    ARM_ADV_SIMD_FP_REG_VM_SHIFT = 0,

    -- ARM Advanced SIMD Data Processing
    AR_ADV_SIMD_DP_U_WIDTH = 1,
    AR_ADV_SIMD_DP_U_SHIFT = 24,
    AR_ADV_SIMD_DP_A_WIDTH = 5,
    AR_ADV_SIMD_DP_A_SHIFT = 19,
    AR_ADV_SIMD_DP_B_WIDTH = 4,
    AR_ADV_SIMD_DP_B_SHIFT = 8,
    AR_ADV_SIMD_DP_C_WIDTH = 4,
    AR_ADV_SIMD_DP_C_SHIFT = 4,

    -- ARM Three Registers of Same Length
    ARM_THREE_REGS_U_WIDTH = 1,
    ARM_THREE_REGS_U_SHIFT = 24,
    ARM_THREE_REGS_C_WIDTH = 2,
    ARM_THREE_REGS_C_SHIFT = 20,
    ARM_THREE_REGS_A_WIDTH = 4,
    ARM_THREE_REGS_A_SHIFT = 8,
    ARM_THREE_REGS_B_WIDTH = 1,
    ARM_THREE_REGS_B_SHIFT = 4,

    -- ARM Three Registers of Different Lengths
    ARM_THREE_REGS_DIFF_LENS_U_WIDTH = 1,
    ARM_THREE_REGS_DIFF_LENS_U_SHIFT = 24,
    ARM_THREE_REGS_DIFF_LENS_B_WIDTH = 2,
    ARM_THREE_REGS_DIFF_LENS_B_SHIFT = 20,
    ARM_THREE_REGS_DIFF_LENS_A_WIDTH = 4,
    ARM_THREE_REGS_DIFF_LENS_A_SHIFT = 8,

    -- ARM Two Registers AND a Scalar
    ARM_TWO_REG_SCALAR_U_WIDTH = 1,
    ARM_TWO_REG_SCALAR_U_SHIFT = 24,
    ARM_TWO_REG_SCALAR_B_WIDTH = 2,
    ARM_TWO_REG_SCALAR_B_SHIFT = 20,
    ARM_TWO_REG_SCALAR_A_WIDTH = 4,
    ARM_TWO_REG_SCALAR_A_SHIFT = 8,

    -- ARM Two Registers and a Shift Amount
    ARM_TWO_REG_SHIFT_U_WIDTH = 1,
    ARM_TWO_REG_SHIFT_U_SHIFT = 24,
    ARM_TWO_REG_SHIFT_IMM3_WIDTH = 3,
    ARM_TWO_REG_SHIFT_IMM3_SHIFT = 19,
    ARM_TWO_REG_SHIFT_A_WIDTH = 4,
    ARM_TWO_REG_SHIFT_A_SHIFT = 8,
    ARM_TWO_REG_SHIFT_L_WIDTH = 1,
    ARM_TWO_REG_SHIFT_L_SHIFT = 7,
    ARM_TWO_REG_SHIFT_B_WIDTH = 1, 
    ARM_TWO_REG_SHIFT_B_SHIFT = 6, 

    -- ARM Two Registers, Misc.
    ARM_TWO_REG_MISC_A_WIDTH = 2,
    ARM_TWO_REG_MISC_A_SHIFT = 16,
    ARM_TWO_REG_MISC_B_WIDTH = 5,
    ARM_TWO_REG_MISC_B_SHIFT = 6,

    -- ARM One Register and Immediate Value
    ARM_ONE_REG_IMM_A_WIDTH = 1,
    ARM_ONE_REG_IMM_A_SHIFT = 24,
    ARM_ONE_REG_IMM_B_WIDTH = 1,
    ARM_ONE_REG_IMM_B_SHIFT = 18,
    ARM_ONE_REG_IMM_C_WIDTH = 1,
    ARM_ONE_REG_IMM_C_SHIFT = 17,
    ARM_ONE_REG_IMM_D_WIDTH = 1,
    ARM_ONE_REG_IMM_D_SHIFT = 16,
    ARM_ONE_REG_IMM_CMODE_WIDTH = 4,
    ARM_ONE_REG_IMM_CMODE_SHIFT = 8,
    ARM_ONE_REG_IMM_OP_WIDTH = 1,
    ARM_ONE_REG_IMM_OP_SHIFT = 5,
    ARM_ONE_REG_IMM_E_WIDTH = 1,
    ARM_ONE_REG_IMM_E_SHIFT = 3,
    ARM_ONE_REG_IMM_F_WIDTH = 1,
    ARM_ONE_REG_IMM_F_SHIFT = 2,
    ARM_ONE_REG_IMM_G_WIDTH = 1,
    ARM_ONE_REG_IMM_G_SHIFT = 1,
    ARM_ONE_REG_IMM_H_WIDTH = 1,
    ARM_ONE_REG_IMM_H_SHIFT = 0,

    -- ARM Floating Point Data Processing
    ARM_FPDP_OPC1_WIDTH = 4,
    ARM_FPDP_OPC1_SHIFT = 20,
    ARM_FPDP_OPC2_WIDTH = 4,
    ARM_FPDP_OPC2_SHIFT = 16,
    ARM_FPDP_OPC3_WIDTH = 2,
    ARM_FPDP_OPC3_SHIFT = 6,
    ARM_FPDP_OPC4_WIDTH = 4,
    ARM_FPDP_OPC4_SHIFT = 0,

    -- ARM Extension Register Load / Store for Advanced SIMD and FPA
    ARM_EXT_REG_LDSTR_OPCODE_WIDTH = 5,
    ARM_EXT_REG_LDSTR_OPCODE_SHIFT = 20,
    ARM_EXT_REG_LDSTR_RN_WIDTH = 4,
    ARM_EXT_REG_LDSTR_RN_SHIFT = 16,
    
    -- ARM Advanced SIMD Element or Structure Load / Store
    ARM_ADV_SIMD_ELEM_STRUC_LDSTR_A_WIDTH = 1,
    ARM_ADV_SIMD_ELEM_STRUC_LDSTR_A_SHIFT = 23,
    ARM_ADV_SIMD_ELEM_STRUC_LDSTR_L_WIDTH = 1,
    ARM_ADV_SIMD_ELEM_STRUC_LDSTR_L_SHIFT = 21,
    ARM_ADV_SIMD_ELEM_STRUC_LDSTR_B_WIDTH = 4,
    ARM_ADV_SIMD_ELEM_STRUC_LDSTR_B_SHIFT = 8,

    -- ARM 8, 16, and 32-bit Transfer between ARM Core and Ext. Registers
    ARM_TRANS_ARM_CORE_EXT_REG_A_WIDTH = 3,
    ARM_TRANS_ARM_CORE_EXT_REG_A_SHIFT = 21,
    ARM_TRANS_ARM_CORE_EXT_REG_L_WIDTH = 1,
    ARM_TRANS_ARM_CORE_EXT_REG_L_SHIFT = 20,
    ARM_TRANS_ARM_CORE_EXT_REG_C_WIDTH = 1,
    ARM_TRANS_ARM_CORE_EXT_REG_C_SHIFT = 8,
    ARM_TRANS_ARM_CORE_EXT_REG_B_WIDTH = 2,
    ARM_TRANS_ARM_CORE_EXT_REG_B_SHIFT = 5,

    -- ARM 64-bit Transfer between ARM Core and Extension Registers
    ARM_LARGE_TRANS_ARM_CORE_EXT_REG_C_WIDTH = 1,
    ARM_LARGE_TRANS_ARM_CORE_EXT_REG_C_SHIFT = 8,
    ARM_LARGE_TRANS_ARM_CORE_EXT_REG_OP_WIDTH = 4,
    ARM_LARGE_TRANS_ARM_CORE_EXT_REG_OP_SHIFT = 4,

    -------------------------------------
    -- 16-bit Thumb Instruction Fields --
    -------------------------------------

    -- Basic 16-bit Thumb Instruction Encoding
    T16_OPCODE_WIDTH = 6,
    T16_OPCODE_SHIFT = 10,

    -- 16-bit Thumb Shift (immediate), Add, Subtract, Move, and Compare
    T16_SASMC_OPCODE_WIDTH = 5,
    T16_SASMC_OPCODE_SHIFT = 9,

    -- 16-bit Thumb Data Processing
    T16_DP_OPCODE_WIDTH = 4,
    T16_DP_OPCODE_SHIFT = 6,

    -- 16-bit Thumb Special Data Instructs and Branch and Exchange
    T16_SDIBX_OPCODE_WIDTH = 4,
    T16_SDIBX_OPCODE_SHIFT = 6,

    -- 16-bit Thumb Load / Store Single Data Item
    T16_LDSTR_SINGLE_OPA_WIDTH = 4,
    T16_LDSTR_SINGLE_OPA_SHIFT = 12,
    T16_LDSTR_SINGLE_OPB_WIDTH = 3,
    T16_LDSTR_SINGLE_OPB_SHIFT = 9,

    -- 16-bit Thumb Misc. Instructions
    T16_MISC_OPCODE_WIDTH = 7,
    T16_MISC_OPCODE_SHIFT = 5,

    -- 16-bit Thumb If-Then
    T16_IF_THEN_OPA_WIDTH = 4,
    T16_IF_THEN_OPA_SHIFT = 4,
    T16_IF_THEN_OPB_WIDTH = 4,
    T16_IF_THEN_OPB_SHIFT = 0,

    -- 16-bit Conditional Branch and Supervisor Call
    T16_CONDB_OPCODE_WIDTH = 4,
    T16_CONDB_OPCODE_SHIFT = 8,

    -------------------------------------
    -- 32-bit Thumb Instruction Fields --
    -------------------------------------

    -- 32-bit Thumb Instruction Encoding
    T32_OP1_WIDTH = 2,
    T32_OP1_SHIFT = 11 + 16,
    T32_OP2_WIDTH = 7,
    T32_OP2_SHIFT = 4 + 16,
    T32_OP_WIDTH = 1,
    T32_OP_SHIFT = 15,

    -- 32-bit Thumb Data Processing (Modified Immediate)
    T32_DPMI_OP_WIDTH = 4, 
    T32_DPMI_OP_SHIFT = 5 + 16,
    T32_DPMI_S_WIDTH = 1,
    T32_DPMI_S_SHIFT = 4 + 16,
    T32_DPMI_RN_WIDTH = 4,
    T32_DPMI_RN_SHIFT = 0 + 16,
    T32_DPMI_RD_WIDTH = 4,
    T32_DPMI_RD_SHIFT = 8,

    -- 32-bit Thumb Modified Immediate Constants
    T32_MIC_I_WIDTH = 1,
    T32_MIC_I_SHIFT = 10 + 16,
    T32_MIC_IMM3_WIDTH = 3,
    T32_MIC_IMM3_SHIFT = 12,
    T32_MIC_A_WIDTH = 1,
    T32_MIC_A_SHIFT = 7,
    T32_MIC_B_WIDTH = 1,
    T32_MIC_B_SHIFT = 6,
    T32_MIC_C_WIDTH = 1,
    T32_MIC_C_SHIFT = 5,
    T32_MIC_D_WIDTH = 1,
    T32_MIC_D_SHIFT = 4,
    T32_MIC_E_WIDTH = 1,
    T32_MIC_E_SHIFT = 3,
    T32_MIC_F_WIDTH = 1,
    T32_MIC_F_SHIFT = 2,
    T32_MIC_G_WIDTH = 1,
    T32_MIC_G_SHIFT = 1,
    T32_MIC_H_WIDTH = 1,
    T32_MIC_H_SHIFT = 0,

    -- 32-bit Thumb Data Processing (plain binary immediate)
    T32_DPPBI_OP_WIDTH = 5,
    T32_DPPBI_OP_SHIFT = 4 + 16,
    T32_DPPBI_RN_WIDTH = 4,
    T32_DPPBI_RN_SHIFT = 0 + 16,

    -- 32-bit Thumb Branches and Misc. Control
    T32_B_MISC_CONT_OP_WIDTH = 7,
    T32_B_MISC_CONT_OP_SHIFT = 4 + 16,
    T32_B_MISC_CONT_OP1_WIDTH = 3,
    T32_B_MISC_CONT_OP1_SHIFT = 12,
    T32_B_MISC_CONT_OP2_WIDTH = 4,
    T32_B_MISC_CONT_OP2_SHIFT = 8,
    T32_B_MISC_CONT_IMM8_WIDTH = 8,
    T32_B_MISC_CONT_IMM8_SHIFT = 0,
    
    -- 32-bit Thumb Change Processor State
    T32_PROC_STATE_OP1_WIDTH = 3,
    T32_PROC_STATE_OP1_SHIFT = 8,
    T32_PROC_STATE_OP2_WIDTH = 8,
    T32_PROC_STATE_OP2_SHIFT = 0,

    -- 32-bit Thumb Misc. Control
    T32_MISC_CONT_OP_WIDTH = 4,
    T32_MISC_CONT_OP_SHIFT = 4,

    -- 32-bit Thumb Load / Store Multiple
    T32_LDSTR_MULT_OP_WIDTH = 2,
    T32_LDSTR_MULT_OP_SHIFT = 7 + 16,
    T32_LDSTR_MULT_W_WIDTH = 1,
    T32_LDSTR_MULT_W_SHIFT = 5 + 16,
    T32_LDSTR_MULT_L_WIDTH = 1,
    T32_LDSTR_MULT_L_SHIFT = 4 + 16,
    T32_LDSTR_MULT_RN_WIDTH = 4,
    T32_LDSTR_MULT_RN_SHIFT = 0 + 16,

    -- 32-bit Thumb Load / Store (Dual, Exclusive) and Table Branch
    T32_LDSTR_DUALEX_OP1_WIDTH = 2,
    T32_LDSTR_DUALEX_OP1_SHIFT = 7 + 16,
    T32_LDSTR_DUALEX_OP2_WIDTH = 2,
    T32_LDSTR_DUALEX_OP2_SHIFT = 4 + 16,
    T32_LDSTR_DUALEX_RN_WIDTH = 4,
    T32_LDSTR_DUALEX_RN_SHIFT = 0 + 16,
    T32_LDSTR_DUALEX_OP3_WIDTH = 4,
    T32_LDSTR_DUALEX_OP3_SHIFT = 4,

    -- 32-bit Thumb Load Word
    T32_LDWRD_OP1_WIDTH = 2,
    T32_LDWRD_OP1_SHIFT = 7 + 16,
    T32_LDWRD_RN_WIDTH = 4,
    T32_LDWRD_RN_SHIFT = 0 + 16,
    T32_LDWRD_OP2_WIDTH = 6,
    T32_LDWRD_OP2_SHIFT = 6,

    -- 32-bit Thumb Load Halfword
    T32_LDHWRD_OP1_WIDTH = 2,
    T32_LDHWRD_OP1_SHIFT = 7 + 16,
    T32_LDHWRD_RN_WIDTH = 4,
    T32_LDHWRD_RN_SHIFT = 0 + 16,
    T32_LDHWRD_RT_WIDTH = 4,
    T32_LDHWRD_RT_SHIFT = 12,
    T32_LDHWRD_OP2_WIDTH = 6,
    T32_LDHWRD_OP2_SHIFT = 6,

    -- 32-bit Thumb Load Byte
    T32_LDBYTE_OP1_WIDTH = 2,
    T32_LDBYTE_OP1_SHIFT = 7 + 16,
    T32_LDBYTE_RN_WIDTH = 4,
    T32_LDBYTE_RN_SHIFT = 0 + 16,
    T32_LDBYTE_RT_WIDTH = 4,
    T32_LDBYTE_RT_SHIFT = 12,
    T32_LDBYTE_OP2_WIDTH = 6,
    T32_LDBYTE_OP2_SHIFT = 6,

    -- 32-bit Thumb Store Single Data Item
    T32_STR_SINGLE_OP1_WIDTH = 3,
    T32_STR_SINGLE_OP1_SHIFT = 5 + 16,
    T32_STR_SINGLE_OP2_WIDTH = 6,
    T32_STR_SINGLE_OP2_SHIFT = 6,
    
    -- 32-bit Thumb Data Processing (shifted register)
    T32_DPSR_OP_WIDTH = 4,
    T32_DPSR_OP_SHIFT = 5 + 16,
    T32_DPSR_S_WIDTH = 1,
    T32_DPSR_S_SHIFT = 4 + 16,
    T32_DPSR_RN_WIDTH = 4,
    T32_DPSR_RN_SHIFT = 0 + 16,
    T32_DPSR_RD_WIDTH = 4,
    T32_DPSR_RD_SHIFT = 8,

    -- 32-bit Thumb Move Register and Immediate Shifts
    T32_MRIS_IMM3_WIDTH = 3,
    T32_MRIS_IMM3_SHIFT = 12,
    T32_MRIS_IMM2_WIDTH = 2,
    T32_MRIS_IMM2_SHIFT = 6,
    T32_MRIS_TYPE_WIDTH = 2,
    T32_MRIS_TYPE_SHIFT = 4,

    -- 32-bit Thumb Data Processing (Register)
    T32_DPR_OP1_WIDTH = 4,
    T32_DPR_OP1_SHIFT = 4 + 16,
    T32_DPR_RN_WIDTH = 4,
    T32_DPR_RN_SHIFT = 0 + 16,
    T32_DPR_OP2_WIDTH = 4,
    T32_DPR_OP2_SHIFT= 4,

    -- 32-bit Thumb Parallel Addition and Subtraction, Signed
    T32_PAR_SADD_SSUB_OP1_WIDTH = 3,
    T32_PAR_SADD_SSUB_OP1_SHIFT = 4 + 16,
    T32_PAR_SADD_SSUB_OP2_WIDTH = 2, 
    T32_PAR_SADD_SSUB_OP2_SHIFT = 4,

    -- 32-bit Thumb Parallel Addition and Subtraction, Unsigned
    T32_PAR_UADD_USUB_OP1_WIDTH = 3,
    T32_PAR_UADD_USUB_OP1_SHIFT = 4 + 16,
    T32_PAR_UADD_USUB_OP2_WIDTH = 2,
    T32_PAR_UADD_USUB_OP2_SHIFT = 4,

    -- 32-bit Thumb Misc.
    T32_MISC_OP1_WIDTH = 2,
    T32_MISC_OP1_SHIFT = 4 + 16,
    T32_MISC_OP2_WIDTH = 2,
    T32_MISC_OP2_SHIFT = 4,

    -- 32-bit Thumb Multiply, Multiply Accumulate, Abs. Diff.
    T32_MUL_ABS_OP1_WIDTH = 3,
    T32_MUL_ABS_OP1_SHIFT = 4 + 16,
    T32_MUL_ABS_RA_WIDTH = 4,
    T32_MUL_ABS_RA_SHIFT = 12,
    T32_MUL_ABS_OP2_WIDTH = 2,
    T32_MUL_ABS_OP2_SHIFT = 4,

    -- 32-bit Thumb Long Multiply, Long Multiply Accumulate, Divide
    T32_LONG_MUL_DIV_OP1_WIDTH = 3,
    T32_LONG_MUL_DIV_OP1_SHIFT = 4 + 16,
    T32_LONG_MUL_DIV_OP2_WIDTH = 4,
    T32_LONG_MUL_DIV_OP2_SHIFT = 4,

    -- 32-bit Thumb Coprocessor, Advanced SIMD, FPIs
    T32_COPROC_SIMD_FPIS_OP1_WIDTH = 6,
    T32_COPROC_SIMD_FPIS_OP1_SHIFT = 4 + 16,
    T32_COPROC_SIMD_FPIS_RN_WIDTH = 4,
    T32_COPROC_SIMD_FPIS_RN_SHIFT = 0 + 16,
    T32_COPROC_SIMD_FPIS_COPROC_WIDTH = 4,
    T32_COPROC_SIMD_FPIS_COPROC_SHIFT = 8,
    T32_COPROC_SIMD_FPIS_OP_WIDTH = 1,
    T32_COPROC_SIMD_FPIS_OP_SHIFT = 4,

    -- 32-bit Thumb Advanced SIMD or Floating Point Register Encoding
    T32_ADV_SIMD_FP_REG_D_WIDTH = 1,
    T32_ADV_SIMD_FP_REG_D_SHIFT = 6 + 16,
    T32_ADV_SIMD_FP_REG_VN_WIDTH = 4,
    T32_ADV_SIMD_FP_REG_VN_SHIFT = 0 + 16,
    T32_ADV_SIMD_FP_REG_VD_WIDTH = 4,
    T32_ADV_SIMD_FP_REG_VD_SHIFT = 12,
    T32_ADV_SIMD_FP_REG_SZ_WIDTH = 1,
    T32_ADV_SIMD_FP_REG_SZ_SHIFT = 8,
    T32_ADV_SIMD_FP_REG_N_WIDTH = 1,
    T32_ADV_SIMD_FP_REG_N_SHIFT = 7,
    T32_ADV_SIMD_FP_REG_Q_WIDTH = 1,
    T32_ADV_SIMD_FP_REG_Q_SHIFT = 6,
    T32_ADV_SIMD_FP_REG_M_WIDTH = 1,
    T32_ADV_SIMD_FP_REG_M_SHIFT = 5,
    T32_ADV_SIMD_FP_REG_VM_WIDTH = 4,
    T32_ADV_SIMD_FP_REG_VM_SHIFT = 0,

    -- 32-bit Thumb Advanced SIMD Data Processing
    T32_ADV_SIMD_DP_U_WIDTH = 1,
    T32_ADV_SIMD_DP_U_SHIFT = 12 + 16,
    T32_ADV_SIMD_DP_A_WIDTH = 5,
    T32_ADV_SIMD_DP_A_SHIFT = 3 + 16,
    T32_ADV_SIMD_DP_B_WIDTH = 4,
    T32_ADV_SIMD_DP_B_SHIFT = 8,
    T32_ADV_SIMD_DP_C_WIDTH = 4,
    T32_ADV_SIMD_DP_C_SHIFT = 4,

    -- 32-bit Thumb Three Registers of Same Length
    T32_THREE_REGS_U_WIDTH = 1,
    T32_THREE_REGS_U_SHIFT = 12 + 16,
    T32_THREE_REGS_C_WIDTH = 2,
    T32_THREE_REGS_C_SHIFT = 4 + 16,
    T32_THREE_REGS_A_WIDTH = 4,
    T32_THREE_REGS_A_SHIFT = 8,
    T32_THREE_REGS_B_WIDTH = 1,
    T32_THREE_REGS_B_SHIFT = 4,

    -- 32-bit Thumb Three Registers of Different Lengths
    T32_THREE_REGS_DIFF_LENS_U_WIDTH = 1,
    T32_THREE_REGS_DIFF_LENS_U_SHIFT = 12 + 16,
    T32_THREE_REGS_DIFF_LENS_B_WIDTH = 2,
    T32_THREE_REGS_DIFF_LENS_B_SHIFT = 4 + 16,
    T32_THREE_REGS_DIFF_LENS_A_WIDTH = 4,
    T32_THREE_REGS_DIFF_LENS_A_SHIFT = 8,


    -- 32-bit Thumb Two Registers AND a Scalar
    T32_TWO_REG_SCALAR_U_WIDTH = 1,
    T32_TWO_REG_SCALAR_U_SHIFT = 12 + 16,
    T32_TWO_REG_SCALAR_B_WIDTH = 2,
    T32_TWO_REG_SCALAR_B_SHIFT = 4 + 16,
    T32_TWO_REG_SCALAR_A_WIDTH = 4,
    T32_TWO_REG_SCALAR_A_SHIFT = 8,

    -- 32-bit Thumb Two Registers and a Shift Amount
    T32_TWO_REG_SHIFT_U_WIDTH = 1,
    T32_TWO_REG_SHIFT_U_SHIFT = 12 + 16,
    T32_TWO_REG_SHIFT_IMM3_WIDTH = 3,
    T32_TWO_REG_SHIFT_IMM3_SHIFT = 3 + 16,
    T32_TWO_REG_SHIFT_A_WIDTH = 4,
    T32_TWO_REG_SHIFT_A_SHIFT = 8,
    T32_TWO_REG_SHIFT_L_WIDTH = 1,
    T32_TWO_REG_SHIFT_L_SHIFT = 7,
    T32_TWO_REG_SHIFT_B_WIDTH = 1, 
    T32_TWO_REG_SHIFT_B_SHIFT = 6, 

    -- 32-bit Thumb Two Registers, Misc.
    T32_TWO_REG_MISC_A_WIDTH = 2,
    T32_TWO_REG_MISC_A_SHIFT = 0 + 16,
    T32_TWO_REG_MISC_B_WIDTH = 5,
    T32_TWO_REG_MISC_B_SHIFT = 6,

    -- 32-bit Thumb One Register and Immediate Value
    T32_ONE_REG_IMM_A_WIDTH = 1,
    T32_ONE_REG_IMM_A_SHIFT = 12 + 16,
    T32_ONE_REG_IMM_B_WIDTH = 1,
    T32_ONE_REG_IMM_B_SHIFT = 2 + 16,
    T32_ONE_REG_IMM_C_WIDTH = 1,
    T32_ONE_REG_IMM_C_SHIFT = 1 + 16,
    T32_ONE_REG_IMM_D_WIDTH = 1,
    T32_ONE_REG_IMM_D_SHIFT = 0 + 16,
    T32_ONE_REG_IMM_CMODE_WIDTH = 4,
    T32_ONE_REG_IMM_CMODE_SHIFT = 8,
    T32_ONE_REG_IMM_OP_WIDTH = 1,
    T32_ONE_REG_IMM_OP_SHIFT = 5,
    T32_ONE_REG_IMM_E_WIDTH = 1,
    T32_ONE_REG_IMM_E_SHIFT = 3,
    T32_ONE_REG_IMM_F_WIDTH = 1,
    T32_ONE_REG_IMM_F_SHIFT = 2,
    T32_ONE_REG_IMM_G_WIDTH = 1,
    T32_ONE_REG_IMM_G_SHIFT = 1,
    T32_ONE_REG_IMM_H_WIDTH = 1,
    T32_ONE_REG_IMM_H_SHIFT = 0,

    -- 32-bit Thumb Floating Point Data Processing
    T32_FPDP_T_WIDTH = 1,
    T32_FPDP_T_SHIFT = 12 + 16,
    T32_FPDP_OPC1_WIDTH = 4,
    T32_FPDP_OPC1_SHIFT = 4 + 16,
    T32_FPDP_OPC2_WIDTH = 4,
    T32_FPDP_OPC2_SHIFT = 0 + 16,
    T32_FPDP_OPC3_WIDTH = 2,
    T32_FPDP_OPC3_SHIFT = 6,
    T32_FPDP_OPC4_WIDTH = 4,
    T32_FPDP_OPC4_SHIFT = 0,

    -- 32-bit Thumb Extension Register Load / Store for Advanced SIMD and FPA
    T32_EXT_REG_LDSTR_T_WIDTH = 1,
    T32_EXT_REG_LDSTR_T_SHIFT = 12 + 16,
    T32_EXT_REG_LDSTR_OPCODE_WIDTH = 5,
    T32_EXT_REG_LDSTR_OPCODE_SHIFT = 4 + 16,
    T32_EXT_REG_LDSTR_RN_WIDTH = 4,
    T32_EXT_REG_LDSTR_RN_SHIFT = 0 + 16,

    -- 32-bit Thumb Advanced SIMD Element or Structure Load / Store
    T32_ADV_SIMD_ELEM_STRUC_LDSTR_A_WIDTH = 1,
    T32_ADV_SIMD_ELEM_STRUC_LDSTR_A_SHIFT = 7 + 16,
    T32_ADV_SIMD_ELEM_STRUC_LDSTR_L_WIDTH = 1,
    T32_ADV_SIMD_ELEM_STRUC_LDSTR_L_SHIFT = 5 + 16,
    T32_ADV_SIMD_ELEM_STRUC_LDSTR_B_WIDTH = 4,
    T32_ADV_SIMD_ELEM_STRUC_LDSTR_B_SHIFT = 8,

    -- 32-bit Thumb 8, 16, and 32-bit Transfer between ARM Core and Ext. Registers
    T32_TRANS_ARM_CORE_EXT_REG_T_WIDTH = 1,
    T32_TRANS_ARM_CORE_EXT_REG_T_SHIFT = 12 + 16,
    T32_TRANS_ARM_CORE_EXT_REG_A_WIDTH = 3,
    T32_TRANS_ARM_CORE_EXT_REG_A_SHIFT = 5 + 16,
    T32_TRANS_ARM_CORE_EXT_REG_L_WIDTH = 1,
    T32_TRANS_ARM_CORE_EXT_REG_L_SHIFT = 4 + 16,
    T32_TRANS_ARM_CORE_EXT_REG_C_WIDTH = 1,
    T32_TRANS_ARM_CORE_EXT_REG_C_SHIFT = 8,
    T32_TRANS_ARM_CORE_EXT_REG_B_WIDTH = 2,
    T32_TRANS_ARM_CORE_EXT_REG_B_SHIFT = 5,

    -- 32-bit Thumb 64-bit Transfer between ARM Core and Extension Registers
    T32_LARGE_TRANS_ARM_CORE_EXT_REG_T_WIDTH = 1,
    T32_LARGE_TRANS_ARM_CORE_EXT_REG_T_SHIFT = 12 + 16,
    T32_LARGE_TRANS_ARM_CORE_EXT_REG_C_WIDTH = 1,
    T32_LARGE_TRANS_ARM_CORE_EXT_REG_C_SHIFT = 8,
    T32_LARGE_TRANS_ARM_CORE_EXT_REG_OP_WIDTH = 4,
    T32_LARGE_TRANS_ARM_CORE_EXT_REG_OP_SHIFT = 4,
}

return const