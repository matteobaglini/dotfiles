#!/bin/bash

echo ">>>> Install Google Chrome"
sudo -iu matteo <<HEREDOC
    if [ ! -f /etc/apt/sources.list.d/google.list ]; then
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
        sudo apt-get update -q -y
        sudo apt-get install -q -y google-chrome-stable
    fi
HEREDOC
