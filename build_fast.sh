#!/bin/bash

source vars.sh

docker buildx build \
	-t hakbox:latest \
	--output=type=docker \
    .

