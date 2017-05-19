#!/bin/bash

# gcc-arm-embedded
sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa
sudo apt-get update
sudo apt-get install -y gcc-arm-embedded

# st-util
mkdir arm-tools
cd arm-tools
git clone https://github.com/texane/stlink.git
cd stlink
make release
cd build/Release
sudo make install
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo ldconfig
