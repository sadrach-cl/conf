local awful = require "awful"

local apps = require "main.apps"
local volume = require "lib.volume"
local brightness = require "lib.brightness"

modkey = "Mod4"
alt = "Mod1"

awful.keyboard.append_global_keybindings({
	awful.key({modkey}, "d", function() awful.spawn(apps.launcher, false) end), -- Rofi
	awful.key({alt}, "c", function() awesome.emit_signal("sidebar::toggle") end), -- Sidebar
	awful.key({alt}, "t", function() awful.titlebar.toggle(client.focus) end), -- Toggle titlebar
	awful.key({alt}, "x", function() awesome.emit_signal("lockscreen::toggle") end), -- Toggle lockscreen
	awful.key({ modkey, "Control" }, "v", function() awful.util.spawn('bash -c "xfce4-clipman-history"') end),
})

-- Volume 
awful.keyboard.append_global_keybindings({
	awful.key({ }, "XF86AudioRaiseVolume", function() volume.increase() end),
	awful.key({ }, "XF86AudioLowerVolume", function() volume.decrease() end),
	awful.key({ }, "XF86AudioMute", function() volume.mute() end)
})

-- Brightness
awful.keyboard.append_global_keybindings({
	awful.key({ }, "XF86MonBrightnessUp", function() brightness.increase() end),
	awful.key({ }, "XF86MonBrightnessDown", function() brightness.decrease() end)
})

