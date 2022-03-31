#!/bin/bash

echo ">>>> Install Haskell packeges"
sudo apt -q -y update

sudo apt -q -y install \
	libffi-dev libffi7 libgmp-dev \
	libgmp10 libncurses-dev libncurses5 libtinfo5

# Any nonzero value for noninteractive installation
export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ghcup install hls --set
ghcup install stack --set
stack config set install-ghc false --global
stack config set system-ghc  true  --global