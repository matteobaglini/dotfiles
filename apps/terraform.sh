#!/bin/bash

echo ">>>> Terraform"

sudo apt-get update 
sudo apt-get install -q -y gnupg software-properties-common

sudo mkdir -p /usr/share/keyrings
wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get update 
sudo apt-get install -q -y terraform