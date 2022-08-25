#!/bin/bash

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
picom --config $HOME/.config/picom/picom.conf --experimental-backends &
nm-applet &
xfce4-power-manager &
bash -c 'pgrep xfce4-clipman || xfce4-clipman' &
bash -c 'light-locker || light-locker' &
nitrogen --restore &
setxkbmap us,es -option grp:alt_shift_toggle &