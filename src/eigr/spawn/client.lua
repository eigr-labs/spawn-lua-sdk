local pb = require "pb"
local socket = require "socket"
local cjson = require "cjson"

local Client = {}
Client.__index = Client

function Client.new(host, port)
    local self = setmetatable({}, Client)
    self.host = host or "localhost"
    self.port = port or 8091
    self.connected = false
    return self
end

function Client:connect()
    -- TODO Actual gRPC connection implementation
    self.connected = true
    return true
end

function Client:register_actor(actor_def)
    -- TODO Implementation of logging via Spawn protocol
    print(("Registering actor: %s"):format(actor_def.name))
end

function Client:invoke_actor(actor, message)
    -- TODO Implementing communication with the Spawn System
end

return Client