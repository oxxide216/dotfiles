#!/usr/bin/sh

set -xe

sudo apt update || true
sudo apt upgrade || true
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting zip unzip make || true

chsh -s /usr/bin/zsh || true

git clone https://github.com/oxxide216/void ~/dev/void || true
cd ~/dev/void || true
./build.sh || true
sudo cp void /usr/bin || true
