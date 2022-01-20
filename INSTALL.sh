#!/bin/bash

# Easy setup for testing

ln -s ~/conf/alacritty ~/.config/
ln -s ~/conf/fondo ~/.config/
ln -s ~/conf/kitty ~/.config/
ln -s ~/conf/mako ~/.config/
ln -s ~/conf/scripts ~/.config/
ln -s ~/conf/sway ~/.config/
ln -s ~/conf/swaylock ~/.config/
ln -s ~/conf/waybar ~/.config/
ln -s ~/conf/wofi ~/.config/
cp -R  ~/conf/themes/* ~/.themes/
cp -R  ~/conf/icons/* ~/.icons/
cp -R  ~/conf/fonts/* ~/.fonts/
chmod -R +x ~/conf/sway/scripts
chmod -R +x ~/conf/waybar/scripts
chmod -R +x ~/conf/scripts
sudo pacman -Syu --needed --noconfirm - < packages.txt


