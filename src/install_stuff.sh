#!/bin/bash
sudo apt-get update -y
sudo apt-get install git unzip curl -y
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install build-essential -y
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh 
source ~/.dnx/dnvm/dnvm.sh
sudo apt-get install libunwind8 gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev -y
dnvm upgrade -r coreclr
