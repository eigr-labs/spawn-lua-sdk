local StatefulActor = {}
StatefulActor.__index = StatefulActor

function StatefulActor:new()
    local self = setmetatable({}, StatefulActor)
    return self
end

function StatefulActor:configure(context)
    error("Must implement configure method")
end

return StatefulActor