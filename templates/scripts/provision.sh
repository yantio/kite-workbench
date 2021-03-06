#!/bin/bash

set -xe

# Install docker
curl https://get.docker.com | sh

# Install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Create a kite user if there isn't one already
getent passwd kite > /dev/null
if [ $? -ne 0 ]; then
  useradd --create-home -G docker --shell /bin/bash kite
fi
