FROM lua:5.4-alpine AS builder

RUN apk add --no-cache \
    make \
    gcc \
    musl-dev \
    git \
    protobuf \
    protobuf-dev

RUN git clone https://github.com/starwing/lua-protobuf && \
    cd lua-protobuf && \
    make && \
    make install

WORKDIR /app

COPY . .

RUN luarocks make spawn-sdk-1.0-0.rockspec && \
    make generate-proto

FROM lua:5.4-alpine

WORKDIR /app

COPY --from=builder /usr/local/lib/lua/5.4/ /usr/local/lib/lua/5.4/
COPY --from=builder /app/src/ ./src/
COPY --from=builder /app/examples/ ./examples/
COPY --from=builder /app/protos/generated/ ./protos/generated/

ENV SPAWN_SIDECAR_HOST=spawn-sidecar
ENV SPAWN_SIDECAR_PORT=8091

CMD ["lua", "examples/main.lua"]