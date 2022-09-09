#! /bin/bash

waybar &
xfce-polkit &
nm-applet &
dunst &
wl-clipboard-history -t &
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY Unity &
hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &


