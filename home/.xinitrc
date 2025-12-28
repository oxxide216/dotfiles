#!/usr/bin/sh

setxkbmap -layout us,ru -option grp:alt_shift_toggle -option caps:escape
feh --no-fehbg --bg-fill dotfiles/wallpapers/space-landscape-1.jpg
xsetroot -name " uwu "
slstatus &
picom -b
pulseaudio --start &
exec dwm
