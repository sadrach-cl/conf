-- Standard awesome library
local spawn = require("awful.spawn")

-- Startup programs
-- Programs starting before spawn_with_shell
os.execute("/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &")
os.execute("nitrogen --restore &")
os.execute("setxkbmap us,es -option grp:alt_shift_toggle")
spawn.with_shell("picom --experimental-backends --vsync")
spawn.with_shell("sleep 3; nm-applet")
spawn.with_shell("xfce4-power-manager")
os.execute("google-drive-ocamlfuse ~/GoogleDrive/")
os.execute("dunst")
spawn.with_shell("bash -c 'pgrep xfce4-clipman || xfce4-clipman'")
