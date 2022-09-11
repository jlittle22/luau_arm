local util = require "src/utility"

local const = util.readOnlyTable {
    R0 = 0,
    R1 = 1,
    R2 = 2,
    R3 = 3,
    R4 = 4,
    R5 = 5,
    R6 = 6,
    R7 = 7,
    R8 = 8,
    R9 = 9,
    R10 = 10,
    R11 = 11,
    R12 = 12,
    SP = 13,  -- Stack pointer
    R13 = 13,
    LR = 14,  -- Link register
    R14 = 14,
    PC = 15,  -- Program counter
    R15 = 15,
}

return const