local wezterm = require 'wezterm'
local config = {}
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Monokai Pro (Gogh)'
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
  { key = "-",          mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "|",          mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = "z",          mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "c",          mods = "LEADER", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = 'p',          mods = 'LEADER', action = wezterm.action.ActivateTabRelative( -1) },
  { key = 'n',          mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'LeftArrow',  mods = 'LEADER', action = wezterm.action.ActivatePaneDirection("Left") },
  { key = 'RightArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection("Right") },
  { key = 'UpArrow',    mods = 'LEADER', action = wezterm.action.ActivatePaneDirection("Up") },
  { key = 'DownArrow',  mods = 'LEADER', action = wezterm.action.ActivatePaneDirection("Down") },
  { key = 'LeftArrow',  mods = 'CTRL',   action = wezterm.action.ActivateTabRelative( -1) },
  { key = 'RightArrow', mods = 'CTRL',   action = wezterm.action.ActivateTabRelative(1) },
}
config.send_composed_key_when_left_alt_is_pressed = true
config.audible_bell = "Disabled"
config.force_reverse_video_cursor = true
config.colors = {
  foreground = "#dcd7ba",
  background = "#1f1f28",
  cursor_bg = "#c8c093",
  cursor_fg = "#c8c093",
  cursor_border = "#c8c093",
  selection_fg = "#c8c093",
  selection_bg = "#2d4f67",
  scrollbar_thumb = "#16161d",
  split = "#16161d",
  ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  indexed = { [16] = "#ffa066",[17] = "#ff5d62" },
}
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)
return config
