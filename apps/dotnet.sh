#!/bin/bash

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y apt-transport-https

sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.1 dotnet-sdk-3.1 dotnet-sdk-5.0 dotnet-sdk-6.0
