local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_scroll_bar = true
config.min_scroll_bar_height = "2cell"
config.scrollback_lines = 3500
config.color_scheme = "Dracula (Official)"
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.initial_cols = 1000
config.initial_rows = 1000
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.font_size = 14
config.bold_brightens_ansi_colors = false
-- config.hide_tab_bar_if_only_one_tab = true
-- config.use_fancy_tab_bar = false

config.text_background_opacity = 0.6
config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/bg.jpg"
config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.1,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1.0,

	-- You can adjust the saturation also.
	saturation = 1.0,
}

-- and finally, return the configuration to wezterm
config.keys = config.keys or {}

for i = 1, 8 do
	-- CTRL+ALT + number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

return config
