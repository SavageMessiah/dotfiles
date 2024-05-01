local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_fancy_tab_bar = false
config.color_scheme = "nordfox"
config.font = wezterm.font("Fira Code")

return config
