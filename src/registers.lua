local Word = require("word.lua")
local Register = {}

local registerStorage = {}

function Register.read(reg)
  return registerStorage[reg] or 0x00
end

function Register.write(reg, value)
  registerStorage[reg] = value 
end

return Register
