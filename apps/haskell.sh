#!/bin/bash

echo ">>>> Install Haskell packeges"
sudo apt-get update

sudo apt-get -q -y install \
	libffi-dev libffi7 libgmp-dev \
	libgmp10 libncurses-dev libncurses5 libtinfo5 \
  libicu-dev libnuma1 libnuma-dev libtinfo5

# Any nonzero value for noninteractive installation
export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ghcup install ghc --set
ghcup install cabal --set
source /home/matteo/.ghcup/env

ghcup install hls --set
ghcup install stack --set

cabal update
cabal install \
  hoogle \
  hlint \
  fsnotify \
  stylish-haskell \
  fourmolu \
  cabal-fmt

stack config set install-ghc false --global
stack config set system-ghc  true  --global

hoogle generate && stack hoogle