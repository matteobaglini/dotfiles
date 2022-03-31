#!/bin/bash

echo ">>>> Update packages"
sudo apt -q -y update

echo ">>>> Install Python packeges"
sudo apt -q -y install \
    python3-dev python3-pip python3-setuptools