#!/usr/bin/sh

set -xe

sudo pacman -Syu || true
sudo pacman -S xorg xorg-xinit ly picom dunst feh brightnessctl bluez bluez-utils playerctl \
     pipewire pipewire-audio pipewire-jack pipewire-pulse wireplumber \
     firefox zsh zsh-autosuggestions zsh-syntax-highlighting \
     telegram-desktop discord flameshot zip unzip man-pages uwufetch make \
     nvidia nvidia-prime || true

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -ris
cd ..
sudo rm -rf yay

sudo pacman -S wget

wget git.io/trans
chmod +x ./trans
sudo mv ./trans /usr/local/bin

sudo pacman -Rssn wget
rm ~/.wget-hsts

sudo systemctl enable ly bluetooth
sudo systemctl start bluetooth.service
systemctl --user --now enable pipewire pipewire-pulse

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
git clone https://git.suckless.org/dmenu $HOME/src/dmenu || true
cd $HOME/src/dmenu
make
sudo make install
