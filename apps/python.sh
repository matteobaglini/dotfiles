#!/bin/bash

echo ">>>> Install Python packeges"
sudo apt -q -y update
sudo apt -q -y install \
    python3-dev python3-pip python3-setuptools