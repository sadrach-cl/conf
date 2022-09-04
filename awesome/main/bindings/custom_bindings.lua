local awful = require "awful"

local apps = require "main.apps"
local volume = require "lib.volume"
local brightness = require "lib.brightness"
require "lib.alttab"

modkey = "Mod4"
alt = "Mod1"

awful.keyboard.append_global_keybindings({
	awful.key({modkey}, "d", function() awful.util.spawn('bash -c "~/.config/awesome/rofi/bin/launcher"') end), -- Rofi
	awful.key({modkey}, "r", function() awful.util.spawn('bash -c "~/.config/awesome/rofi/bin/runner"') end), -- Rofi exec
	awful.key({modkey, "Shift" }, "e", function() awful.util.spawn('bash -c "~/.config/awesome/rofi/bin/powermenu"') end), -- Rofi
	awful.key({modkey}, "x", function() awful.util.spawn('bash -c "~/.config/awesome/rofi/bin/screenshot"') end), -- Rofi

	awful.key({alt}, "c", function() awesome.emit_signal("sidebar::toggle") end), -- Sidebar
	awful.key({alt}, "t", function() awful.titlebar.toggle(client.focus) end), -- Toggle titlebar
	awful.key({alt}, "x", function() awesome.emit_signal("lockscreen::toggle") end), -- Toggle lockscreen
	awful.key({ modkey, "Control" }, "v", function() awful.util.spawn('bash -c "xfce4-clipman-history"') end),
	awful.key({ modkey }, "l", function() awful.util.spawn('bash -c "betterlockscreen --lock"') end),
	awful.key({ alt }, "Tab", function() awesome.emit_signal("bling::window_switcher::turn_on") end, { description = "Window switcher", group = "client" }),
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

