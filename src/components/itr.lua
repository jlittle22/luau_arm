-- Module representing the IT BLock State Register
-- Documentation: ARM Manual, Page 51

--- FUCKING FIGURE THIS OUT LATER

local IT = {}

IT.__index = IT

function IT:new()
    obj = {
        base_cond = 0,
        entry_points = 0
    }

    setmetatable(obj, self)

    return obj
end

function IT:cond(val)
    if val then
        self.base_cond = val
    else
        return self.base_cond
    end
end

function IT:entryPoints(val)
    if val then
        self.entry_points = val
    else
        return self.entry_points
    end
end

function IT:advance()
    if self.base_cond == 0 then
        self.entry_points = 0
    else
        self.entry_points = bit32.extract(bit32.lshift(self.entry_points, 1), 0, 5)
    end
end


-- Add the other two functions please

return IT