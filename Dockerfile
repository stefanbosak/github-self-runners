# Ubuntu LTS release version
ARG UBUNTU_RELEASE=24.04

# base for image
FROM ubuntu:${UBUNTU_RELEASE}

# set the GitHub runner version
ARG RUNNER_VERSION=2.323.0

# Add a user for the runner
RUN useradd -m -s /bin/bash runner

# update the base packages
RUN apt-get update -y && apt-get upgrade -y

# install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    libicu74 \
    curl \
    jq \
    sudo \
    unzip \
    && apt-get clean &&  rm -rf /var/lib/apt/lists/*

# Set up the runner user
RUN echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/runner

# cd into the user directory, download and unpack the github actions runner
RUN mkdir -p /home/runner/actions-runner && cd /home/runner/actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# Install dependencies
RUN cd /home/runner/actions-runner \
    && ./bin/installdependencies.sh

# copy over the start.sh script
COPY start.sh /home/runner/start.sh

# make the script executable
RUN chown runner:runner /home/runner/start.sh && chmod +x /home/runner/start.sh

# since the config and run script for actions are not allowed to be run by root,
# set the user to "runner" so all subsequent commands are run as the user
USER runner

# set the entrypoint to the start.sh script
ENTRYPOINT ["/home/runner/start.sh"]
