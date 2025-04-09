local pb = require "pb"
local socket = require "socket"
local cjson = require "cjson"

local Client = {}
Client.__index = Client

function Client.new(host, port)
    local self = setmetatable({}, Client)
    self.host = host or "localhost"
    self.port = port or 8091
    return self
end

function Client:invoke_actor(actor, message)
    -- Implementação da comunicação com o Spawn System
end

return Client