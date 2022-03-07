#!/bin/env bash

# set background
bash $HOME/.config/spectrwm/.fehbg

# Kill if already running
killall -9 picom xfce4-power-manager ksuperkey dunst sxhkd eww

# Launch Conkeww
#sed -i "s/colors\/color-.*/colors\/color-everforest.yuck\")/g" $HOME/.config/conkeww/eww.yuck
#eww --config $HOME/.config/conkeww/ open conkeww-main

# start hotkey daemon
sxhkd -c $HOME/.config/spectrwm/sxhkdrc &

# Launch notification daemon
dunst -config $HOME/.config/spectrwm/dunstrc &

# Enable Super Keys For Menu
#ksuperkey -e 'Super_L=Alt_L|F1' &
#ksuperkey -e 'Super_R=Alt_L|F1' &

# power manager and picom start
xfce4-power-manager &

while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom &
#picom --config $HOME/.config/spectrwm/picom.conf &

if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi

# Start udiskie
udiskie &

# replace neovim colorscheme
#sed -i "s/theme =.*$/theme = \"everforest\",/g" $HOME/.config/nvim/lua/chadrc.lua

# change xfce4-terminal colorscheme
#XFCE_TERM_PATH="$HOME/.config/xfce4/terminal"
#cp "$XFCE_TERM_PATH"/colorschemes/everforest "$XFCE_TERM_PATH"/terminalrc
