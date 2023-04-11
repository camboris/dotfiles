local wezterm = require 'wezterm'
local config = {}
-- config.color_scheme = 'Batman'
config.color_scheme = 'Monokai Pro (Gogh)'
-- config.color_scheme = 'Monokai Pro Ristretto (Gogh)'

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.font_size = 16
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  { family = "Symbols Nerd Font Mono", scale = 0.75 }
})

config.leader = { key = "a", mods = "CTRL" }
config.keys = {
  { key = "-", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "|", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "c", mods = "LEADER", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative( -1) },
  { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'LeftArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection("Left") },
  { key = 'RightArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection("Right") },
  { key = 'UpArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection("Up") },
  { key = 'DownArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection("Down") },
  { key = 'LeftArrow', mods = 'CTRL', action = wezterm.action.ActivateTabRelative( -1) },
  { key = 'RightArrow', mods = 'CTRL', action = wezterm.action.ActivateTabRelative(1) },

}

return config
