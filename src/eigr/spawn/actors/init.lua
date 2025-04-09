local context = require "eigr.spawn.actors.context"
local behavior = require "eigr.spawn.actors.behavior"
local actions = require "eigr.spawn.actors.actions"
local value = require "eigr.spawn.actors.value"

return {
    StatefulActor = require "eigr.spawn.actors.stateful_actor",
    ActorContext = context,
    ActorBehavior = behavior,
    ActionBindings = actions,
    Value = value
}