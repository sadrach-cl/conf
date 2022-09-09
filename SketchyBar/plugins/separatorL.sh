#!/usr/bin/env bash

sketchybar   --add item       separatorL center                          \
             --set separatorL  icon=                                \
                               icon.font="$FONT_ICON:Regular:30"    \
                              background.padding_left=-1              \
                              background.padding_right=-2             \
                              label.drawing=off                       \
                              icon.color=$BG        \
                              y_offset=8                                        \
                              
