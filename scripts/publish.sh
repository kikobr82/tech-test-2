#!/bin/bash
BUILD_SHA=`git rev-parse --short HEAD`
REPOSITORY=newone
TAG=tech-test-2-prod

docker tag ${TAG} ${REPOSITORY}/${TAG}:${BUILD_SHA} 
docker push ${REPOSITORY}/${TAG}:${BUILD_SHA} 