#!/usr/bin/env sh
 source  ~/.config/SketchyBar/style/frappe.sh 

sketchybar   --add item       separator center                          \
             --set separator  icon=                                \
                               icon.font="$FONT_ICON:Regular:30"    \
                              background.padding_left=0              \
                              background.padding_right=0             \
                              label.drawing=off                       \
                              icon.color=$BG        \
                              y_offset=8                                        \




# sketchybar   --add item       separator right                          \
#              --set separator  icon=                                  \
#                                icon.font="$FONT_ICON:Regular:14.0"    \
#                                icon.padding_left= 3 \
#                                icon.padding_right= 3 \
#                                icon.color=$GREEN        \
#                                background.color=$BG        \