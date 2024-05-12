#!/bin/bash

source vars.sh

docker buildx build --platform="linux/amd64,linux/arm64,linux/arm/v7" -t seanbox -t $IMAGE:latest -t $IMAGE:$TAG .

