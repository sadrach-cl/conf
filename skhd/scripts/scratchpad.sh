#!/usr/bin/env bash

scratchpad_id=$(yabai -m query --windows | jq '.[] | select(.title=="Kitty").id')

if [[ "$scratchpad_id" -lt 1 ]]; then
  scratchpad_id=$(Kitty | awk '{print $NF}')
  sleep 1
  yabai -m window --focus "$scratchpad_id"
  yabai -m window --toggle float
  yabai -m window --resize abs:1920:1080
  yabai -m window --move abs:960:540
else
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '.minimized')
  current_space=$(yabai -m query --spaces --space | jq '.index')

  if [[ "$is_minimized" -eq 1 ]]; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
  else
    yabai -m window "$scratchpad_id" --minimize
  fi
fi