local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"

-- Clock
local clock = wibox.widget.textbox()
clock.font = "SFProDisplay Nerd Font 12"

gears.timer {
	timeout = 60,
	autostart = true,
	call_now = true,
	callback = function()
		clock.markup = os.date("%a %H:%M")
	end
}

return clock
