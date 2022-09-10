-- Luau class representing ARMv7 machine half words.
-- See: https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/ARM-Instruction-Set-Encoding/ARM-instruction-set-encoding

local util = require "src/utility"

local Halfword = {}

function Halfword:new(bits)
    local obj
    if bits ~= nil then
        if (bits <= 65535 and bits >= 0) or (bits >= -32768 and bits <= 32767) then
            obj = { bits = bits}
        else
            error(string.format("%d is doesn't fit into a halfword (16-bits).", bits))
        end
    else
        obj = { bits = 0 }
    end
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Halfword:extract(shift, width)
    return bit32.extract(self.bits, shift, width)
end

function Halfword:val()
    return self.bits
end

-- Utility Functions --

function Halfword:stringify()
    str = "{ "
    for key, val in pairs(self) do
        str ..= (key .. " = " .. util.tobinary16(val) .. ", ")
    end
    str = str:sub(1, -3)
    str ..= " }"
    return str
end



return Word
