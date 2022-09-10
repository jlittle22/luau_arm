-- Luau class representing ARMv7 machine words.
-- See: https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/ARM-Instruction-Set-Encoding/ARM-instruction-set-encoding

-- What is COND? 
-- The COND field indicates whether or not an instruction can be conditional.

-- What is OP1?
-- Indicates the class of the instruction being executed with a conditional.

-- What is OP?
-- Indicates a specific subclass of instruction being executed.

local util = require "src/utility"

local const = util.readOnlyTable {

    ----------------------------
    -- ARM Instruction Fields --
    ----------------------------

    -- Basic ARM Instruction Set Encoding Fields
    COND_WIDTH = 4,
    COND_SHIFT = 28,
    OP1_WIDTH =  3,
    OP1_SHIFT = 25,
    OP_WIDTH = 1,
    OP_SHIFT = 4,

    -- ARM Data Processing (Register) Instruction Fields (Page 195 of the ARM Manual)
    DPR_OP_WIDTH = 5,
    DPR_OP_SHIFT = 20,
    DPR_IMM5_WIDTH = 5,
    DPR_IMM5_SHIFT = 7,
    DPR_OP2_WIDTH = 2,
    DPR_OP2_SHIFT = 5,

    -- ARM Data Processing (Register-shifted Register)
    DPRSR_OP1_WIDTH = 5,
    DPRSR_OP1_SHIFT = 20,
    DPRSR_OP2_WIDTH = 2,
    DPRSR_OP2_SHIFT = 5,

    -- ARM Data Processing (Immediate)
    DPI_OP_WIDTH = 5,
    DPI_OP_SHIFT = 20,
    DPI_RN_WIDTH = 4,
    DPI_RN_SHIFT = 16,

    -- ARM Modified Immediate Constants Encoding
    MIC_ROTATION_WIDTH = 4,
    MIC_ROTATION_SHIFT = 8,
    MIC_A_WIDTH = 1,
    MIC_A_SHIFT = 7,
    MIC_B_WIDTH = 1,
    MIC_B_SHIFT = 6,
    MIC_C_WIDTH = 1,
    MIC_C_SHIFT = 5,
    MIC_D_WIDTH = 1,
    MIC_D_SHIFT = 4,
    MIC_E_WIDTH = 1,
    MIC_E_SHIFT = 3,
    MIC_F_WIDTH = 1,
    MIC_F_SHIFT = 2,
    MIC_G_WIDTH = 1,
    MIC_G_SHIFT = 1,
    MIC_H_WIDTH = 1,
    MIC_H_SHIFT = 0,

    -- ARM Multiply and Multiply Accumulate
    MUL_OP_WIDTH = 4,
    MUL_OP_SHIFT = 20,

    -- ARM Saturating Addition and Subtraction
    SADDSUB_OP_WIDTH = 2,
    SADDSUB_OP_SHIFT = 21,

    -- ARM Halfword Multiply and Multiply Accumulate
    HWMUL_OP1_WIDTH = 2,
    HWMUL_OP1_SHIFT = 21,
    HWMUL_OP_WIDTH = 1,
    HWMUL_OP_SHIFT = 5,

    -- ARM Extra Load / Store
    XTRA_LD_STR_OP1_WIDTH = 5,
    XTRA_LD_STR_OP1_SHIFT = 20,
    XTRA_LD_STR_RN_WIDTH = 4,
    XTRA_LD_STR_RN_SHIFT = 16,
    XTRA_LD_STR_OP2_WIDTH = 2,
    XTRA_LD_STR_OP2_SHIFT = 5,

    -- ARM Unprivileged Extra Load / Store
    UNPRIV_XTRA_LD_STR_OP_WIDTH = 1,
    UNPRIV_XTRA_LD_STR_OP_SHIFT = 20,
    UNPRIV_XTRA_LD_STR_OP2_WIDTH = 2,
    UNPRIV_XTRA_LD_STR_OP2_SHIFT = 5,

    -- ARM Synchronization Primitives
    SYNC_OP_WIDTH = 4,
    SYNC_OP_SHIFT = 20,

    -- ARM MSR (immediate)
    MSRI_OP_WIDTH = 1,
    MSRI_OP_SHIFT = 22,
    MSRI_OP1_WIDTH = 4,
    MSRI_OP1_SHIFT = 16,
    MSRI_OP2_WIDTH = 8,
    MSRI_OP2_SHIFT = 0,

    -- ARM Misc. Instructions
    MISC_OP_WIDTH = 2,
    MISC_OP_SHIFT = 21,
    MISC_OP1_WIDTH = 4,
    MISC_OP1_SHIFT = 16,
    MISC_B_WIDTH = 1,
    MISC_B_SHIFT = 9,
    MISC_OP2_WIDTH = 3,
    MISC_OP2_SHIFT = 4,

    -- ARM Load / Store Word and Unsigned Byte
    LD_STR_A_WIDTH = 1,
    LD_STR_A_SHIFT = 25,
    LD_STR_OP1_WIDTH = 5,
    LD_STR_OP1_SHIFT = 20,
    LD_STR_RN_WIDTH = 4,
    LD_STR_RN_SHIFT = 16,
    LD_STR_B_WIDTH = 1,
    LD_STR_B_SHIFT = 4,

    -- ARM Media Instructions
    MEDIA_OP1_WIDTH = 5,
    MEDIA_OP1_SHIFT = 20,
    MEDIA_RD_WIDTH = 4,
    MEDIA_RD_SHIFT = 12,
    MEDIA_OP2_WIDTH = 3,
    MEDIA_OP2_SHIFT = 5,
    MEDIA_RN_WIDTH = 4,
    MEDIA_RN_SHIFT = 0,

    -- ARM Parallel Addition and Subtraction, Signed
    PAR_SADD_SSUB_OP1_WIDTH = 2,
    PAR_SADD_SSUB_OP1_SHIFT = 20,
    PAR_SADD_SSUB_OP2_WIDTH = 3,
    PAR_SADD_SSUB_OP2_SHIFT = 5,

    -- ARM Parallel Addition and Subtraction, Unsigned
    PAR_UADD_USUB_OP1_WIDTH = 2,
    PAR_UADD_USUB_OP1_SHIFT = 20,
    PAR_UADD_USUB_OP2_WIDTH = 3,
    PAR_UADD_USUB_OP2_SHIFT = 5,

    -- ARM Packing, Unpacking, Saturation, and Reversal
    PUSR_OP1_WIDTH = 3,
    PUSR_OP1_SHIFT = 20,
    PUSR_A_WIDTH = 4,
    PUSR_A_SHIFT = 16,
    PUSR_OP2_WIDTH = 3,
    PUSR_OP2_SHIFT = 5,

    -- ARM Signed Multiply, Signed and Unsigned Divide
    SMUL_SUDIV_OP1_WIDTH = 3,
    SMUL_SUDIV_OP1_SHIFT = 20,
    SMUL_SUDIV_A_WIDTH = 4,
    SMUL_SUDIV_A_SHIFT = 12,
    SMUL_SUDIV_OP2_WIDTH = 3,
    SMUL_SUDIV_OP2_SHIFT = 5,

    -- ARM Branch, Branch w/ Link, Block Data Transfer
    B_OP_WIDTH = 6,
    B_OP_SHIFT = 20,
    B_RN_WIDTH = 4,
    B_RN_SHIFT = 16,
    B_R_WIDTH = 1,
    B_R_SHIFT = 15,

    -- ARM Coprocessor Instruction and Supervisor Call
    COP_SUP_OP1_WIDTH = 6,
    COP_SUP_OP1_SHIFT = 20,
    COP_SUP_RN_WIDTH = 4,
    COP_SUP_RN_SHIFT = 16,
    COP_SUP_COPROC_WIDTH = 4,
    COP_SUP_COPROC_SHIFT = 8,
    COP_SUP_OP_WIDTH = 1,
    COP_SUP_OP_SHIFT = 4,

    -- ARM Unconditional Instructions
    UNCOND_OP1_WIDTH = 8,
    UNCOND_OP1_SHIFT = 20,
    UNCOND_RN_WIDTH = 4,
    UNCOND_RN_SHIFT = 16,
    UNCOND_OP_WIDTH = 1,
    UNCOND_OP_SHIFT = 4,

    -- ARM Memory Hints, Advanced SIMD Instructs, and Misc. Instructs (aka MAM)
    MAM_OP1_WIDTH = 7,
    MAM_OP1_SHIFT = 20,
    MAM_RN_WIDTH = 4,
    MAM_RN_SHIFT = 16,
    MAM_OP2_WIDTH = 4,
    MAM_OP2_SHIFT = 4,

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




}

local Word = {}

function Word:new(bits)
    local obj
    if bits ~= nil then
        obj = { bits = bits}
    else
        obj = { bits = 0 }
    end
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Word:cond()
    return bit32.extract(self.bits, const.COND_SHIFT, const.COND_WIDTH)
end

function Word:op1()
    return bit32.extract(self.bits, const.OP1_SHIFT, const.OP1_WIDTH)
end

function Word:op()
    return bit32.extract(self.bits, const.OP_SHIFT, const.OP_WIDTH)
end

function Word:val()
    return self.bits
end

-- Utility Functions --

function Word:stringify()
    str = "{ "
    for key, val in pairs(self) do
        str ..= (key .. " = " .. util.tobinary32(val) .. ", ")
    end
    str = str:sub(1, -3)
    str ..= " }"
    return str
end



return Word
