
local function readOnly(t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function (t, k, v)
            error("read-only: operation not allowed.", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

local function tobinary32(int)
    temp = int
    bits = {}
    for i=1,32 do
        bits[33 - i] = tostring(bit32.extract(temp, 0, 1))
        temp = bit32.lshift(temp, -1)
    end

    return "0b" .. table.concat(bits)
end

return { readOnlyTable = readOnly }