local Value = {}
Value.__index = Value

function Value.at()
    return setmetatable({}, Value)
end

function Value:response(resp)
    self.response = resp
    return self
end

function Value:state(state)
    self.state = state
    return self
end

function Value:reply()
    return self
end

return Value