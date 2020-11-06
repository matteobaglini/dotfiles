#!/bin/bash

echo ">>>> Install VIM 8"
sudo apt remove -q -y vim-*
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update -q -y
sudo apt install -q -y vim-gtk3
