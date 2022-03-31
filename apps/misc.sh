#!/bin/bash

sudo apt install -q -y shellcheck

sudo snap install slack --classic
sudo snap install postman
sudo snap install gimp
sudo snap install vlc
sudo snap install scrcpy

sudo pip3 install envdir
sudo pip3 install togglCli

npm install -g tldr

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
