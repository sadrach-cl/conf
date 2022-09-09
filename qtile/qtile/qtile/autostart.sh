#!/bin/sh
#feh --bg-scale /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png
picom --experimental-backends --vsync & disown  #should prevent screen tearing on most setups if needed
nitrogen --restore &
nm-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Low battery notifier
#~/.config/qtile/scripts/check_battery.sh & disown
