local wezterm = require 'wezterm'
local config = {}

--config.font = wezterm.font 'Monaspace Neon'
config.font = wezterm.font_with_fallback {
  'Monaspace Neon',
  'Iosevka Nerd Font Mono',
}
config.harfbuzz_features = {'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'}

config.font_size = 14.0
config.color_scheme = 'Catppuccin Mocha (Gogh)'
config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true

return config
