local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'
config.scrollback_lines = 3500
config.color_scheme = "Dracula (Official)"
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.line_height = 1.25
config.initial_cols = 1000
config.initial_rows = 1000
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.line_height = 1.25
config.font_size = 16
config.bold_brightens_ansi_colors = false

config.window_background_opacity = 1
config.text_background_opacity = 0.5
config.background = {
  {
    source = {
      File = os.getenv("HOME") .. '/.config/wezterm/bg.png',
    },
    hsb = { brightness = 0.1 },
  },
}

-- and finally, return the configuration to wezterm
return config
