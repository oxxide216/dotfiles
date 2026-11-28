#!/usr/bin/sh

export LANG=en_US.utf8
export LC_ALL=en_US.utf8

setxkbmap -layout us,ru -option grp:alt_shift_toggle -option caps:escape
feh --no-fehbg --bg-fill dotfiles/wallpapers/retrowave.jpg
xsetroot -name " uwu "
slstatus &
picom -b
pulseaudio --start &
exec dwm
