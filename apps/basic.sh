#!/bin/bash

echo ">>>> Basic packeges"
sudo apt -q -y update
sudo add-apt-repository universe
sudo apt -q -y update
sudo apt -q -y install \
    build-essential autoconf linux-kernel-headers \
    curl wget tree whois unzip gpg htop \
    jq httpie bat fd-find gnome-tweaks dconf-cli \
    fonts-firacode apt-utils ca-certificates gnupg \
    lsb-release graphviz

if ! dra --version &>/dev/null; then
  DRA_VERSION=0.4.2
  curl -fsSL -o dra.deb "https://github.com/devmatteini/dra/releases/download/$DRA_VERSION/dra_${DRA_VERSION}_amd64.deb"
  sudo dpkg -i ./dra.deb
  rm ./dra.deb
  dra completion bash >"$HOME"/.local/share/bash-completion/completions/dra
fi
