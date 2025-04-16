#!/bin/bash
docker buildx build --no-cache --build-arg RUNNER_VERSION=${RUNNER_VERSION} --build-arg UBUNTU_RELEASE=${UBUNTU_RELEASE} --build-arg NAME=${NAME} -t runner-image .
