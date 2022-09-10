-- ARMv7 Emulator
-- Quick Spec: https://courses.cs.washington.edu/courses/cse469/20wi/armv7.pdf

local util = require "src/utility"
local Word = require "src/word"

local function emulate()
    local w = Word:new()

    print("w: ", w:stringify())

    local b = Word:new(255)

    print("b: ", b:stringify())

    return 0
end

return { emulate = emulate }