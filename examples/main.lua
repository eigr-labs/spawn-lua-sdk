local spawn = require("eigr.spawn")
local JoeActor = require("examples.joe_actor")

local system = spawn.new_system("spawn-system")
    :with_actor(JoeActor)
    :start()