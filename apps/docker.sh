#!/bin/bash

echo ">>>> Install Docker & tools"
if ! docker version &>/dev/null; then
    wget -qO- https://get.docker.com/ | bash
    sudo usermod -aG docker "$USER"
    newgrp docker
fi
if ! docker-compose --version &>/dev/null; then
    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

