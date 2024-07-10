local wezterm = require 'wezterm'
local kanagawa_lotus = require 'colors/kanagawa-lotus'
local kanagawa_wave = require 'colors/kanagawa-wave'

local function colors_for_appearance(appearance)
  if appearance:find 'Dark' then
    return kanagawa_wave
  else
    return kanagawa_lotus
  end
end

wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = colors_for_appearance(appearance)
  -- set overrides.color_scheme to set a built in scheme
  if overrides.colors ~= scheme then
    overrides.colors = scheme
    window:set_config_overrides(overrides)
  end
end)

return {
  font = wezterm.font ('FiraCode Nerd Font Mono', { weight = 450}), -- 450 is the weight for the Retina weight apparently
  font_rules = {

  },
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  force_reverse_video_cursor = true,
  initial_rows = 40,
  initial_cols = 120,
}
