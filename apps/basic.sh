#!/bin/bash

echo ">>>> Update packages"
sudo apt -q -y update
sudo add-apt-repository universe
sudo apt -q -y update

echo ">>>> Install basic packeges"
sudo apt -q -y install \
    build-essential autoconf linux-kernel-headers \
    curl wget tree whois unzip gpg htop \
    jq httpie bat fd-find gnome-tweaks dconf-cli