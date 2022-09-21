#!/bin/bash

echo ">>>> Update packages"
sudo apt -q -y update
sudo add-apt-repository universe
sudo apt -q -y update

echo ">>>> Install basic packeges"
sudo apt -q -y install \
    build-essential autoconf linux-kernel-headers \
    curl wget tree whois unzip gpg htop \
    jq httpie bat fd-find gnome-tweaks dconf-cli \
    fonts-firacode apt-utils ca-certificates


echo ">>>> Install basic packeges"
curl -fsSL -o dra.deb \
    https://github.com/devmatteini/dra/releases/download/0.3.8/dra_0.3.8_amd64.deb
sudo dpkg -i ./dra.deb
rm ./dra.deb
dra completion bash >"$HOME"/.local/share/bash-completion/completions/dra