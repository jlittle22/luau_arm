-- TODO(David): Get off the fucking grass game and implement 16 genereral purpose registers!!!
-- See `src/consts/registers.lua`!!!

local reg_consts = require "src/consts/registers"

local GPR = {}

GPR.__index = GPR

-- TODO
function GPR:new()
    obj = {}
    setmetatable(obj, self)
    return obj
end

return GPR