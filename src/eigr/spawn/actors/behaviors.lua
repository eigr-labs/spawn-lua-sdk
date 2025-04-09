local NamedActorBehavior = {}
NamedActorBehavior.__index = NamedActorBehavior

function NamedActorBehavior.new(name)
    local self = setmetatable({}, NamedActorBehavior)
    self.name = name
    self.actions = {}
    self.channels = {}
    return self
end

function NamedActorBehavior:channel(channel_name)
    table.insert(self.channels, channel_name)
    return self
end

function NamedActorBehavior:action(action_name, bindings)
    self.actions[action_name] = bindings
    return self
end

return {
    named = function(name)
        return NamedActorBehavior.new(name)
    end
}