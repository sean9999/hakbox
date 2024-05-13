#!/bin/bash

source vars.sh

docker buildx build \
    --platform="linux/amd64,linux/arm64,linux/arm/v8" \
    -t hakbox \
    -t $IMAGE:latest \
    -t $IMAGE:$TAG . \
    --output=type=registry,push=true

