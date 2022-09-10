-- ARMv7 Emulator
-- Quick Spec: https://courses.cs.washington.edu/courses/cse469/20wi/armv7.pdf

local util = require "src/utility"
local Word = require "src/word"

local function emulate()
    local instructions = {
        0b00000000000000000000000000000000,
        0b11110000000000000000000000000000,
        0b00001110000000000000000000000000,
        0b00000000000000000000000000010000,
    }

    for _, w in ipairs(instructions) do
        local word = Word:new(w)
        print(word:stringify())
        print(util.tobinary32(word:cond()))
        print(util.tobinary32(word:op1()))
        print(util.tobinary32(word:op()))
    end

    return 0
end

return { emulate = emulate }