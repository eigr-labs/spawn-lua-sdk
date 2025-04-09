local spawn = require "eigr.spawn"
local StatefulActor = spawn.Actors.StatefulActor
local ActorBehavior = spawn.Actors.ActorBehavior
local ActionBindings = spawn.Actors.ActionBindings
local Value = spawn.Actors.Value

local Request = require "domain_pb".Request
local Reply = require "domain_pb".Reply
local State = require "domain_pb".State

local JoeActor = StatefulActor:new()

function JoeActor:configure(context)
    return ActorBehavior.named("JoeActor")
        :channel("test.channel")
        :action("SetLanguage", ActionBindings.of(Request, self.setLanguage))
end

function JoeActor:setLanguage(context, msg)
    local prev_state = context:get_state()
    -- Do something with state if needed
    
    return Value.at()
        :response(Reply:new({response = "Hi " .. msg.language .. ". Hello From Lua"}))
        :state(self:updateState(msg.language))
        :reply()
end

function JoeActor:updateState(language)
    return State:new({languages = {language}})
end

return JoeActor