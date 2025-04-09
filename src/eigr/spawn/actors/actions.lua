local ActionBindings = {}
ActionBindings.__index = ActionBindings

function ActionBindings.of(message_type, handler)
    return setmetatable({
        message_type = message_type,
        handler = handler
    }, ActionBindings)
end

return {
    ActionBindings = ActionBindings
}