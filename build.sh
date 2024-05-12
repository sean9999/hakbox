#!/bin/bash

source vars.sh

docker build -t seanbox -t $IMAGE:latest -t $IMAGE:$TAG .

