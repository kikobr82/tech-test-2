#!/bin/bash
TAG=tech-test-2-test
echo "Running eslint Tests"
docker run ${TAG} npm run eslint

echo "Running Unit Tests"

docker run ${TAG} npm test 
