#!/bin/bash

# define GitHub URIs
export GITHUB_URI="https://github.com"
export GITHUB_RAW_URI="https://raw.githubusercontent.com"

# Ubuntu LTS releases URI
export UBUNTU_RELEASES_URI="https://changelogs.ubuntu.com/meta-release-lts"

export RUNNER_PROJECT="actions/runner"
export RUNNER_URI="${GITHUB_URI}/${RUNNER_PROJECT}";

# extract last GitHub runner version
export RUNNER_VERSION=$(git ls-remote --refs --sort='version:refname' --tags "${RUNNER_URI}" | awk -F"/" '!($0 ~ /alpha|beta|rc|dev|nightly|\{/){print $NF}' | tail -n 1 | sed 's/^v//g')

# extract last Ubuntu LTS release
export UBUNTU_RELEASE=$(curl -s "${UBUNTU_RELEASES_URI}" | grep -Eo '[0-9]{2}\.[0-9]{2}' | tail -n 1)

# GitHub action runner organization and repository name
export REPO=${REPO:-"<organization>/<repository>"}

# GitHub action runner registration token
export REG_TOKEN="<token_from_runners_page>"

# GitHub action runner name
export NAME=${NAME:-"runner-$(cat /proc/sys/kernel/random/uuid)"}

# container name
export CONTAINER_NAME=${CONTAINER_NAME:-"runner-image"}
