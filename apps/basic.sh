#!/bin/bash

echo ">>>> Update packages"
sudo apt -q -y update
sudo add-apt-repository universe
sudo apt -q -y update

echo ">>>> Install basic packeges"
sudo apt -q -y install \
    build-essential autoconf linux-kernel-headers \
    git curl wget tree whois unzip gpg htop \
    jq httpie bat fd-find libsecret-1-0 \
    libsecret-1-dev gnome-tweaks dconf-cli