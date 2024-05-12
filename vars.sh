#!/bin/bash

IMAGE=crazyhorsecoding/seanbox
TAG="$(git tag --sort=-version:refname | head -n 1)"

