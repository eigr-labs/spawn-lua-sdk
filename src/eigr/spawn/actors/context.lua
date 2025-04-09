local ActorContext = {}
ActorContext.__index = ActorContext

function ActorContext.new(state)
    local self = setmetatable({}, ActorContext)
    self.state = state
    return self
end

function ActorContext:get_state()
    return self.state
end

return ActorContext