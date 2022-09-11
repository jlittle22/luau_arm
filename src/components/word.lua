-- Luau class representing ARMv7 machine words.
-- See: https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/ARM-Instruction-Set-Encoding/ARM-instruction-set-encoding

local util = require "src/utility"

local Word = {}

function Word:new(bits)
    local obj
    if bits ~= nil then
        if (bits <= 4294967295 and bits >= 0) or (bits >= -2147483648 and bits <= 2147483647) then
            obj = { bits = bits}
        else
            error(string.format("%d is doesn't fit into a word (32-bits).", bits))
        end
    else
        obj = { bits = 0 }
    end
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Word:extract(shift, width)
    return bit32.extract(self.bits, shift, width)
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
