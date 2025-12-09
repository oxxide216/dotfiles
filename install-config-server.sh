#!/usr/bin/sh

mkdir -p $HOME/.config

ln -s $HOME/dotfiles/home/.zshrc $HOME/.zshrc || true
ln -s $HOME/dotfiles/home/.config/uwufetch $HOME/.config/uwufetch || true
