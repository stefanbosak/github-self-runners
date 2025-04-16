#!/bin/bash
REPO=${REPO}
REG_TOKEN=${REG_TOKEN}
NAME="runner-$(cat /proc/sys/kernel/random/uuid)"
CONTAINER_NAME=${CONTAINER_NAME:-"runner-image"}

docker container run \
  --detach \
  --env REPO=${REPO} \
  --env REG_TOKEN=${REG_TOKEN} \
  --env NAME=${NAME} \
  --name ${NAME} \
  --rm \
  ${CONTAINER_NAME}
