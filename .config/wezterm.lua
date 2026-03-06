local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 14
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}
config.enable_tab_bar = false

return config
