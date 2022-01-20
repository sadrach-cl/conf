#!/bin/bash

# Easy setup for testing

ln -s ./alacritty ~/.config/
ln -s ./fondo ~/.config/
ln -s ./kitty ~/.config/
ln -s ./mako ~/.config/
ln -s ./scripts ~/.config/
ln -s ./sway ~/.config/
ln -s ./swaylock ~/.config/
ln -s ./waybar ~/.config/
ln -s ./wofi ~/.config/
cp -R  ./themes/* ~/.themes/
cp -R  ./icons/* ~/.icons/
cp -R  ./fonts/* ~/.fonts/
chmod -R +x ./sway/scripts
chmod -R +x ./waybar/scripts
chmod -R +x ./scripts
sudo pacman -Syu --needed --noconfirm - < packages.txt


