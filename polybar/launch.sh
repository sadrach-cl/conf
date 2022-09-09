#!/usr/bin/env bash

#Add this script to your wm startup file.
DIR="$HOME/.config/polybar/main"

# Terminate already running bar instances
#killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q sad1 -c "$DIR"/config.ini &

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log
#polybar sad1 | tee -a /tmp/polybar1.log & disown
#polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."





