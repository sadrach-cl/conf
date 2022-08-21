-- Standard awesome library
local spawn = require("awful.spawn")

-- Startup programs
-- Programs starting before spawn_with_shell
os.execute("lxpolkit")
os.execute("nitrogen --restore &")
os.execute("setxkbmap us,es -option grp:alt_shift_toggle")
spawn.with_shell("picom --experimental-backends --vsync")
spawn.with_shell("sleep 3; nm-applet")
spawn.with_shell("xfce4-power-manager")
--spawn.with_shell("xfce4-clipman")
