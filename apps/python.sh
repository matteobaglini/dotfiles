#!/bin/bash

echo ">>>> Install Python packeges"

sudo apt-get update
sudo apt-get -q -y install \
    python3-dev python3-pip python3-setuptools