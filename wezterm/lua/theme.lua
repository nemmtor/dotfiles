local M = {}

M.apply = function(config)
  -- config.initial_cols = 1000
  -- config.initial_rows = 1000
  config.color_scheme = "Catppuccin Frappe"
  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
  config.font_size = 14
  config.enable_scroll_bar = true
  config.enable_tab_bar = false
  config.min_scroll_bar_height = "2cell"
  config.scrollback_lines = 3500
  config.tab_bar_at_bottom = true
  config.window_decorations = "RESIZE"
  config.bold_brightens_ansi_colors = false
  config.show_new_tab_button_in_tab_bar = false
  config.text_background_opacity = 1
  config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/bg.png"
  config.window_background_image_hsb = {
    brightness = 0.02,
    hue = 1,
    saturation = 0.5,
  }
end

return M
