package = "spawn-sdk"
version = "0.1.0"
source = {
    url = "git://github.com/eigr-labs/spawn-lua-sdk"
}
description = {
    summary = "Lua SDK for Spawn Actor Framework",
    homepage = "https://github.com/eigr/spawn",
    license = "Apache-2.0"
}
dependencies = {
    "lua >= 5.3",
    "lua-protobuf >= 0.3.3",
    "luasocket >= 3.1.0",
    "lua-cjson >= 2.1.0"
}
build = {
    type = "builtin",
    modules = {
        ["eigr.spawn"] = "src/eigr/spawn/init.lua",
        ["eigr.spawn.actors"] = "src/eigr/spawn/actors/init.lua"
    }
}