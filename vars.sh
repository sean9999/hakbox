#!/bin/bash

IMAGE=ghrc.io/sean9999/hakbox
TAG="$(git tag --sort=-version:refname | head -n 1)"

