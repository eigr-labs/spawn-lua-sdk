local Spawn = {}
local Client = require("eigr.spawn.client")
local Actors = require("eigr.spawn.actors")

function Spawn.new_system(name)
    local system = {
        name = name,
        actors = {}
    }
    
    local self = setmetatable(system, { __index = Spawn })
    return self
end

function Spawn:with_actor(actor_module)
    table.insert(self.actors, actor_module)
    return self
end

function Spawn:start()
    print(("Starting Spawn System [%s]..."):format(self.name))
    
    -- TODO Initialize gRPC client
    local client = Client.new("localhost", 8091)
    
    -- TODO Registers all actors
    for _, actor in ipairs(self.actors) do
        local config = actor:configure()
        print(("Registering Actor [%s]..."):format(config.name))
        
        -- TODO Implement actual logging logic
        client:register_actor({
            name = config.name,
            channels = config.channels,
            actions = config.actions
        })
    end
    
    print("System started successfully")
    return true
end

return {
    new_system = Spawn.new_system
}