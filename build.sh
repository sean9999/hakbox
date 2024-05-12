#!/bin/bash

source vars.sh

docker build -t seanbox -t $IMAGE:$TAG

