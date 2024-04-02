local wezterm = require('wezterm')

local M = {}

M.apply = function(config)
  config.keys = {
    { key = 't', mods = 'CMD', action = wezterm.action.Nop },
  }
end

return M
