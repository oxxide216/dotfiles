#!/usr/bin/sh

ln -s $HOME/dotfiles/home/.gitconfig $HOME/.gitconfig || true
ln -s $HOME/dotfiles/home/.zshrc $HOME/.zshrc || true
ln -s $HOME/dotfiles/home/.xinitrc $HOME/.xinitrc || true
ln -s $HOME/dotfiles/home/.config/dunst $HOME/.config/dunst || true
ln -s $HOME/dotfiles/home/.config/uwufetch $HOME/.config/uwufetch || true
ln -s $HOME/dotfiles/home/.config/picom.conf $HOME/.config/picom.conf || true
ln -s $HOME/dotfiles/home/.config/user-dirs.dirs $HOME/.config/user-dirs.dirs || true
ln -s $HOME/dotfiles/home/.config/user-dirs.locale $HOME/.config/user-dirs.locale || true

sudo ln -s /etc/sv/dbus /var/service/
sudo sv up dbus

sudo ln -s /etc/sv/elogind /var/service/
sudo sv up elogind

sudo ln -s /etc/sv/ly /var/service/

sudo ln -s /etc/sv/bluetoothd /var/service/
sudo usermod -aG bluetooth $USER
sudo sv start bluetoothd

sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/10-wireplumber.conf
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/20-pipewire-pulse.conf

mkdir -p $HOME/.config/autostart/
ln -s /usr/share/pipewire/pipewire.desktop $HOME/.config/autostart/
ln -s /usr/share/wireplumber/wireplumber.desktop $HOME/.config/autostart/
