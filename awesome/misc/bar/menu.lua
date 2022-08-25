local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

-- Menu
local menu = wibox.widget.textbox()
menu.font = "SFProDisplay Nerd Font 12"
menu.markup = "<span foreground='"..beautiful.white.."'>󰍜</span>"

menu:connect_signal("mouse::enter", function() 
	menu.markup = "<span foreground='"..beautiful.white.."'>󰍜</span>"
end)

menu:connect_signal("mouse::leave", function()
	menu.markup = "<span foreground='"..beautiful.white.."'>󰍜</span>"
end)

menu:buttons(gears.table.join(
	awful.button({ }, 1, function()
		awesome.emit_signal("sidebar::toggle")
	end)
))

return menu
