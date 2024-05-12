#!/bin/bash

source vars.sh

docker push $IMAGE:latest
docker push $IMAGE:$TAG

