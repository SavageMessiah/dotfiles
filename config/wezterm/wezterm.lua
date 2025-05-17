local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.use_fancy_tab_bar = false
config.color_scheme = "Kanagawa (Gogh)"
config.font = wezterm.font("Fira Code")

return config
