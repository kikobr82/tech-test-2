#!/bin/bash
BUILD_SHA=`git rev-parse --short HEAD`
BUILD_VERSION=`cat package.json |jq -r .version`
BUILD_DESCRIPTION=`cat package.json |jq -r .description`
TAG=tech-test-2

docker build \
    -t ${TAG} \
    --build-arg BUILD_SHA="${BUILD_SHA}" \
    --build-arg BUILD_VERSION="${BUILD_VERSION}" \
    --build-arg BUILD_DESCRIPTION="${BUILD_DESCRIPTION}" .