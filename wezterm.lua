local wezterm = require 'wezterm'
local config = {}

--config.font = wezterm.font 'Monaspace Neon'
config.font = wezterm.font_with_fallback {
  'Monaspace Neon',
  'Iosevka Nerd Font Mono',
}

--config.font = wezterm.font 'Iosevka Nerd Font Mono'
config.font_size = 18.0
config.color_scheme = 'Catppuccin Mocha (Gogh)'
config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true

return config
