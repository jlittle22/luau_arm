-- ARMv7 Emulator
-- Quick Spec: https://courses.cs.washington.edu/courses/cse469/20wi/armv7.pdf
--
-- Cortex A Programming Guide: https://developer.arm.com/documentation/den0013/d/Introduction-to-Assembly-Language/Comparison-with-other-assembly-languages

local util = require "src/utility"
local Word = require "src/components/word"
local ibf = require "src/consts/instruction_bit_fields"
local reg = require "src/consts/registers"
local cpsr = require "src/components/cpsr"

local Emulator = {}

function Emulator:new() 
    local obj = setmetatable({}, self)
    self.__index = self

    obj.CPSR = cpsr:new()
    
    return obj
end

function Emulator:emulate()
    self.instructions = {
        0b00000000000000000000000000000000,
        0b11110000000000000000000000000000,
        0b00001110000000000000000000000000,
        0b00000000000000000000000000010000,
    }

    for _, w in ipairs(self.instructions) do
        local word = Word:new(w)
        print(word:stringify())
        print(util.tobinary32(word:extract(ibf.ARM_COND_SHIFT, ibf.ARM_COND_WIDTH)))
        print(util.tobinary32(word:extract(ibf.ARM_OP1_SHIFT, ibf.ARM_OP1_WIDTH)))
        print(util.tobinary32(word:extract(ibf.ARM_OP_SHIFT, ibf.ARM_OP_WIDTH)))
    end

    return 0
end

return Emulator