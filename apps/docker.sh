#!/bin/bash

echo ">>>> Install Docker & tools"
sudo -i <<HEREDOC
    if ! docker version &>/dev/null; then
        wget -qO- https://get.docker.com/ | bash
        sudo usermod -aG docker matteo
    fi
    if ! docker-compose --version &>/dev/null; then
        curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` \
                > /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    fi
HEREDOC

echo ">>>> That's all, rock on!"
