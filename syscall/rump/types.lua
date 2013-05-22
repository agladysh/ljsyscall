-- types for rump kernel

abi = require "syscall.abi"

if abi.os == "netbsd" then
  return require "syscall.types" -- if running rump on netbsd just return normal types
end

-- running on another OS

require "syscall.rump.ffitypes"

local errors = require "syscall.netbsd.errors"
local c = require "syscall.netbsd.constants"
local ostypes = require "syscall.netbsd.types"

local init = require "syscall.types2".init

return init(abi, c, errors, ostypes)


