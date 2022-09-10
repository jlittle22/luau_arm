-- Luau class representing ARMv7 machine words.
-- See: https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/ARM-Instruction-Set-Encoding/ARM-instruction-set-encoding

local util = require "src/utility"

local const = util.readOnlyTable {
    COND_WIDTH = 4,
    COND_SHIFT = 28,
    OP1_WIDTH =  3,
    OP1_SHIFT = 25,
    OP_WIDTH = 1,
    OP_SHIFT = 4
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