-- Module representing the Application Program State Register
-- Documentation: ARM Manual, Page 49

local APSR = {}

APSR.__index = APSR

function APSR:new()
    obj = {
        N = 0,
        Z = 0,
        C = 0,
        V = 0,
        Q = 0,
        GE = {
            [0] = 0,  -- Bit 16
            [1] = 0,  -- Bit 17
            [2] = 0,  -- Bit 18
            [3] = 0   -- Bit 19
        },
        RAZ_SBZP = {
            [0] = 0,  -- Bit 24
            [1] = 0,  -- Bit 25
            [2] = 0   -- Bit 26
        }
    }

    setmetatable(obj, self)

    return obj
end

function APSR:N(val)
    if val then
        self.N = val
    else
        return self.N
    end
end

function APSR:Z(val)
    if val then
        self.Z = val
    else
        return self.Z
    end
end

function APSR:C(val)
    if val then
        self.C = val
    else
        return self.C
    end
end

function APSR:V(val)
    if val then
        self.V = val
    else
        return self.V
    end
end

function APSR:Q(val)
    if val then
        self.Q = val
    else
        return self.Q
    end
end

function APSR:GE(i, val)
    if val then
        self.GE[i] = val
    else
        return self.GE[i]
    end
end

function APSR:RAZ_SBZP(i, val)
    if val then
        self.RAZ_SBZP[i] = val
    else
        return self.RAZ_SBZP[i]
    end
end

return APSR