#!/bin/sh

exec xautolock -detectsleep 
  -time 3 -locker "i3lock -d -c 000070" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
