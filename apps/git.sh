#!/bin/bash

# https://askubuntu.com/questions/773455/what-is-the-correct-way-to-use-git-with-gnome-keyring-and-https-repos
echo ">>>> Install Git packeges"
sudo apt-get -q -y install \
    git libsecret-1-0 libsecret-1-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/libsecret

# Install syntax-highlighting pager and diff output
# https://github.com/dandavison/delta
sudo dra download -i -s "git-delta_{tag}_amd64.deb" dandavison/delta