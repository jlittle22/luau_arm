local Emulator = require "src/emulator"

function main()
    local e = Emulator:new()

    return e:emulate()
end

print("ret: ", main())
