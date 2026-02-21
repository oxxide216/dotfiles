#!/usr/bin/sh

set -xe

sudo xbps-install xorg xinit picom dunst feh brightnessctl bluez playerctl \
     pulseaudio firefox zsh zsh-autosuggestions zsh-syntax-highlighting \
     flameshot zip unzip man-pages make dbus elogind libspa-bluetooth \
     libX11-devel libXft-devel libXinerama-devel libXrandr-devel \
     pam-devel rtkit gcc pkg-config freetype-devel || true

sudo xbps-install wget

wget git.io/trans
chmod +x ./trans
sudo mv ./trans /usr/local/bin

sudo xbps-remove -o wget
rm ~/.wget-hsts

chsh -s /usr/bin/zsh || true

mkdir $HOME/src || true

git clone https://github.com/oxxide216/dwm $HOME/src/dwm || true
cd $HOME/src/dwm
make
sudo make install

git clone https://github.com/oxxide216/st $HOME/src/st || true
cd $HOME/src/st
make
sudo make install

git clone https://github.com/oxxide216/slstatus $HOME/src/slstatus || true
cd $HOME/src/slstatus
make
sudo make install

git clone https://github.com/aario/dmenu $HOME/src/dmenu || true
cd $HOME/src/dmenu
make
sudo make install

git clone https://codeberg.org/Chrischan/ly $HOME/src/ly --recursive || true
cd $HOME/src/ly
make
sudo make install
sudo make install installrunit

sudo xbps-install nim

git clone https://github.com/tsoding/boomer $HOME/src/boomer || true
cd $HOME/src/boomer
nimble build
sudo cp boomer /usr/bin

sudo xbps-remove nim
