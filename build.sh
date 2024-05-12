#!/bin/bash

source vars.sh

docker buildx build -t seanbox -t $IMAGE:latest -t $IMAGE:$TAG .

