---@type wezterm
local wezterm = require("wezterm")
local c = wezterm.config_builder()

-- require("keys").apply(c)

c.font = wezterm.font_with_fallback({
	"SFMono Nerd Font Mono",
	"Symbols Nerd Font",
})
-- c.default_prog = { "/usr/bin/zsh", "-1" }
-- c.enable_wayland = true
-- window
c.window_decorations = "RESIZE"
c.window_padding = { left = 5, right = 3, top = 3, bottom = 3 }
-- dim unfocused panes
c.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 0.8,
}
-- etc.
c.adjust_window_size_when_changing_font_size = false
c.audible_bell = "Disabled"
c.clean_exit_codes = { 130 }
c.default_cursor_style = "BlinkingBar"
c.command_palette_font_size = 13.0
c.window_frame = { font_size = 13.0 }
c.window_background_opacity = 0.95

wezterm.plugin.require("https://github.com/catppuccin/wezterm").apply_to_config(c, {
	sync = true,
	sync_flavors = { light = "latte", dark = "mocha" },
})
wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(c, {
	position = "bottom",
	max_width = 32,
	dividers = "rounded", -- or "slant_left", "arrows", "rounded", false
	indicator = {
		leader = {
			enabled = true,
			off = " ",
			on = " ",
		},
		mode = {
			enabled = false,
			names = {
				resize_mode = "RESIZE",
				copy_mode = "VISUAL",
				search_mode = "SEARCH",
			},
		},
	},
	tabs = {
		numerals = "arabic", -- or "roman"
		pane_count = "superscript", -- or "subscript", false
		brackets = {
			active = { "", ":" },
			inactive = { "", ":" },
		},
	},
	clock = { -- note that this overrides the whole set_right_status
		enabled = true,
		format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
	},
})
return c
