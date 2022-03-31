#!/bin/bash

echo ">>>> Install .NET packeges"
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get -q -y update
sudo apt-get install -q -y \
	apt-transport-https \ 
	dotnet-sdk-2.1 \
	dotnet-sdk-3.1 \
	dotnet-sdk-5.0 \
	dotnet-sdk-6.0