-- The Current Program Status Register (CPSR)
-- The Current Program Status Register (CPSR) holds processor status and control information:
-- • The APSR, see The Application Program Status Register (APSR) on page A2-49.
-- • The current instruction set state, see Instruction set state register, ISETSTATE on page A2-50.
-- • The execution state bits for the Thumb If-Then instruction, see IT block state register, ITSTATE on page A2-51.
-- • The current endianness, see Endianness mapping register, ENDIANSTATE on page A2-53.
-- • The current processor mode.
-- • Interrupt and asynchronous abort disable bits.
--
-- SOURCE: PAGE 1147 OF THE ARMv7 MANUAL

local apsr = require "src/components/apsr"
local itr = require "src/components/itr"

local CPSR = {}

CPSR.__index = CPSR

function CPSR:new()
    obj = {
        APSR = apsr:new(),
        IT = itr:new(),
        J = 0,
        E = 0,
        A = 0,
        I = 0,
        F = 0,
        T = 0,
        M = 0  -- NOT a bit!!! M[4:0] ... using number representation for easy comparisions against bit fields.
    }

    setmetatable(obj, self)

    return obj
end

function CPSR:N(val)
    return self.APSR:N(val)
end

function CPSR:Z(val)
    return self.APSR:Z(val)
end

function CPSR:C(val)
    return self.APSR:C(val)
end

function CPSR:V(val)
    return self.APSR:V(val)
end

function CPSR:Q(val)
    return self.APSR:Q(val)
end

function CPSR:GE(i, val)
    return self.APSR:GE(i, val)
end

function CPSR:RAZ_SBZP(i, val)
    return self.APSR:RAZ_SBZP(i, val)
end

return CPSR