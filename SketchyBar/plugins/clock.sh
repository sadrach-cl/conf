#!/usr/bin/env bash

 source  ~/.config/SketchyBar/style/frappe.sh 

sketchybar -m --add item clock center                                                                  \
              --set clock       update_freq=1                                                     \
                                  label.color=$LAVENDER                                             \
                                  label.font="$FONT_LABEL:Bold:14"     \
                                  script="~/.config/Sketchybar/plugins/time.sh"           \
                                  label.padding_left=5             \
                                  label.padding_right=10             \
                                  icon.font="$FONT_ICON:Regular:14.0"    \
                                  icon=                                \
                                  icon.padding_left= 10 \
                                  icon.padding_right= 10 \
                                  icon.color=$MAUVE        \
                                  background.color=$BG        \
                                                                    

