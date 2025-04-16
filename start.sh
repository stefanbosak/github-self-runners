#!/bin/bash

# GitHub organization and repository name
REPO=${REPO}

# GitHub actions runner registration token for organization/repository
REG_TOKEN=${REG_TOKEN}

# GitHub runner name
NAME=${NAME:="runner-$(cat /proc/sys/kernel/random/uuid)"}

cd /home/runner/actions-runner || exit

# cleanup handler
cleanup() {
  echo "Removing runner..."
  ./config.sh remove --unattended --token ${REG_TOKEN}
}

# register cleanup handler
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

# perform GitHub runner registration and activation
./config.sh --url https://github.com/${REPO} --token ${REG_TOKEN} --name ${NAME}

# start GitHub runner
./run.sh & wait $!
