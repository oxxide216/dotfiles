#!/usr/bin/sh

mkdir -p $HOME/.config

ln -s $HOME/dotfiles/home/.zshrc $HOME/.zshrc || true
ln -s $HOME/dotfiles/home/.xinitrc $HOME/.xinitrc || true
ln -s $HOME/dotfiles/home/.config/dunst $HOME/.config/dunst || true
ln -s $HOME/dotfiles/home/.config/uwufetch $HOME/.config/uwufetch || true
ln -s $HOME/dotfiles/home/.config/picom.conf $HOME/.config/picom.conf || true
ln -s $HOME/dotfiles/home/.config/user-dirs.dirs $HOME/.config/user-dirs.dirs || true
ln -s $HOME/dotfiles/home/.config/user-dirs.locale $HOME/.config/user-dirs.locale || true

sudo ln -s $HOME/dotfiles/etc/environment /etc/environment || true

sudo ln -s /etc/sv/dbus /var/service/
sudo sv up dbus

sudo ln -s /etc/sv/elogind /var/service/
sudo sv up elogind

sudo ln -s /etc/sv/ly /var/service/

sudo ln -s /etc/sv/bluetoothd /var/service/
sudo usermod -aG bluetooth $USER
sudo sv start bluetoothd
