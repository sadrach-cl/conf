#!/bin/bash
# baraction.sh for spectrwm status bar

## DISK
#hdd() {
#  hdd="$(df -h / | awk 'NR==2 { print $4 }' | sed s/i//g)"
#  echo -e " $hdd"
#}

## RAM
#mem() {
#  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
#  echo -e " $mem"
#}

## CPU
#cpu() {
#  cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
#  echo -e " $cpu"
#}

## VOLUME
vol() {
    vol=`volume`
    echo -e " $vol"
}

## BATTERY
#bat() {
#    bat=$(cat /sys/class/power_supply/*BAT*/capacity)
#    echo -e " $bat%"
#}

blight() {
  light=`brightness --get`
  echo -e " $light"
}

## DATE & TIME
date_time() {
  date_time="$(date '+%A, %d/%m/%y %I:%M %p')"
  echo -e " $date_time"
}

## UPTIME
##up_time() {
#  echo " $(uptime --pretty | sed -e 's/up //g' -e 's/ days/d/g' -e 's/ day/d/g' -e 's/ hours/h/g' -e 's/ hour/h/g' -e 's/ minutes/m /g' -e 's/, / /g')"
#}

SLEEP_SEC=0.25
#loops forever outputting a line every SLEEP_SEC secs

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
  echo "+@fg=1;+@fg=0;+@bg=1; $(cpu) +@fg=2;+@fg=0;+@bg=2; $(mem) +@fg=3;+@fg=0;+@bg=3; $(hdd) +@fg=4;+@fg=0;+@bg=4; $(blight) $(vol) +@fg=5;+@fg=0;+@bg=5; $(bat) +@fg=6;+@fg=0;+@bg=6; $(date_time) +@fg=0;+@fg=7;+@bg=0; $(up_time)"
	sleep $SLEEP_SEC
done

