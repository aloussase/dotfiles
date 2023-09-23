local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font("HasklugNerdFontMono")

config.window_background_opacity = 0.8
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}

config.window_decorations = "NONE"

config.color_scheme = 'ayu'

config.cursor_blink_rate = 800

return config
