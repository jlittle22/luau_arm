local emulator = require "src/emulator"

function main()
    return emulator.emulate()
end

print("ret: ", main())
