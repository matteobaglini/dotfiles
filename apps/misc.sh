#!/bin/bash

sudo apt install -q -y shellcheck

sudo snap install slack --classic
sudo snap install postman
sudo snap install gimp
sudo snap install vlc
sudo snap install scrcpy

sudo pip3 install envdir
sudo pip3 install togglCli

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo ">>>> Install Google Chrome"
sudo -iu matteo <<HEREDOC
    if [ ! -f /etc/apt/sources.list.d/google.list ]; then
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
        sudo apt-get update -q -y
        sudo apt-get install -q -y google-chrome-stable
    fi
HEREDOC

echo ">>>> Install FireFox"
sudo apt install -q -y firefox

echo ">>>> Install Starship"
curl -fsSL https://starship.rs/install.sh | bash