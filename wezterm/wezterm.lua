local wezterm = require("wezterm")
local theme = require("lua.theme")
local keys = require("lua.keys")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

theme.apply(config)
keys.apply(config)
return config
