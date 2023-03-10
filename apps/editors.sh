#!/bin/bash

echo ">>>> Install VIM 8"

sudo apt-get remove -q -y vim-*
sudo add-apt-repository ppa:jonathonf/vim

sudo apt-get update
sudo apt-get install -q -y vim-gtk3

sudo snap install code --classic
sudo snap install rider --classic
sudo snap install datagrip --classic
sudo snap install webstorm --classic
sudo snap install intellij-idea-ultimate --classic
