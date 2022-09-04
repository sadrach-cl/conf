#!/bin/bash

_ps=(polybar picom dunst mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

/usr/lib/xfce-polkit/xfce-polkit &
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
picom --config $HOME/.config/awesome/picom/picom.conf --experimental-backends &
nm-applet &
xfce4-power-manager &
#bash -c 'pgrep xfce4-clipman || xfce4-clipman' &
#bash -c 'light-locker || light-locker' &
nitrogen --restore &
setxkbmap us,es -option grp:alt_shift_toggle &