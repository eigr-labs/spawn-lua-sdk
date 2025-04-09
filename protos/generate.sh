#!/bin/sh

echo "Compiling protobuf files..."
protoc --lua_out=src/generated/ -I protos/ \
    protos/eigr/spawn/actors/actor.proto \
    protos/eigr/spawn/actors/state.proto \
    protos/eigr/spawn/actors/protocol.proto \
    protos/eigr/spawn/actors/extensions.proto \
    protos/eigr/spawn/actors/healthcheck.proto \
    protos/eigr/spawn/actors/test.proto