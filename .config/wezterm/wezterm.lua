local wezterm = require 'wezterm'

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Mocha'
  else
    return 'Catppuccin Latte'
  end
end

wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

return {
  font = wezterm.font ('FiraCode Nerd Font Mono', { weight = 450, italic = false}), -- 450 is the weight for the Retina weight apparently
  color_scheme = "Catppuccin Mocha",
  hide_tab_bar_if_only_one_tab = true,
  -- window_decorations = "RESIZE",
}
