#!/bin/bash

calendar=(
	icon=cal
	icon.font="$FONT:Black:14.0"
	icon.padding_right=0
	label.width=45
	label.align=right
	padding_left=15
	update_freq=30
	script="$PLUGIN_DIR/calendar.sh"
	click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar center \
	--set calendar "${calendar[@]}" \
	--subscribe calendar system_woke
