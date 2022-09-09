#!/bin/bash
 
entries="Active Screen Output Area Window"
 
selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')
 
case $selected in
  active)
    /sbin/grimshot --notify save active;;
  screen)
    /sbin/grimshot --notify save screen;;
  output)
    /sbin/grimshot --notify save output;;
  area)
    /sbin/grimshot --notify save area;;
  window)
    /sbin/grimshot --notify save window;;
esac
