local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Abernathy'
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 14
config.window_background_opacity = 0.9
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
config.enable_tab_bar = false

return config
