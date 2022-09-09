--- ~~~~~~~~~~~~~~~~~~  @author rxyhn ~~~~~~~~~~~~~~~~~~~~~~
--- ~~~~~~~~~~~~ https://github.com/rxyhn ~~~~~~~~~~~~~~~~~~
--- ~~~~~~~~~~~~~~~~~~  @Moded sadrach ~~~~~~~~~~~~~~~~~~~~~~
--- ~~~~~~~~~~~~ https://github.com/sadrach-cl ~~~~~~~~~~~~~~~~~~

pcall(require, "luarocks.loader")
local gears = require("gears")
local beautiful = require("beautiful")

--	Theme
local theme_dir = gears.filesystem.get_configuration_dir() .. "theme/"
beautiful.init(theme_dir .. "theme.lua")

--	Configuration
--require("configuration")

--	Modules
require("modules")

--	UI
require("ui")

--	Garbage
--- Enable for lower memory consumption
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
gears.timer({
	timeout = 5,
	autostart = true,
	call_now = true,
	callback = function()
		collectgarbage("collect")
	end,
})
