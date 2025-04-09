GOOGLE_PROTO_ROOT = protos/
GOOGLE_PROTO_FILES = \
    google/protobuf/descriptor.proto \
    google/protobuf/any.proto \
    google/api/http.proto \
    google/api/annotations.proto

SPAWN_PROTO_ROOT = protos/eigr
SPAWN_PROTO_FILES = \
    spawn/actors/actor.proto \
    spawn/actors/state.proto \
    spawn/actors/protocol.proto \
    spawn/actors/extensions.proto \
    spawn/actors/healthcheck.proto \
    spawn/actors/test.proto

.PHONY: all

all: build compile-proto install

# Tasks
build: clean deps
	echo "Building the project..."

clean:
	echo "Cleaning up..."

deps:
	echo "Installing dependencies..."
	luarocks install --local lua-protobuf
	luarocks install --local luasocket
	luarocks install --local lua-cjson

install: build
	echo "Installing the project..."
	luarocks make --local spawn-lua-sdk-0.1-0.rockspec

test:
	go test -v ./...

compile-proto:
	echo "Compiling protobuf files..."
    docker run --rm -v $(pwd):/work -w /work znly/protoc --plugin=protoc-gen-lua=/usr/bin/protoc-gen-lua --lua_out=src/generated -I=${GOOGLE_PROTO_ROOT} ${GOOGLE_PROTO_FILES}
    docker run --rm -v $(pwd):/work -w /work znly/protoc --plugin=protoc-gen-lua=/usr/bin/protoc-gen-lua --lua_out=src/generated -I=${SPAWN_PROTO_ROOT} ${SPAWN_PROTO_FILES}
	


			 
