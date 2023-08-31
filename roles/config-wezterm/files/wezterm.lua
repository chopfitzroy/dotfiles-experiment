local wezterm = require 'wezterm'

local act = wezterm.action

local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
local wsl_domains = wezterm.default_wsl_domains()

-- https://wezfurlong.org/wezterm/config/lua/wezterm/hostname.html
for _, dom in ipairs(wsl_domains) do
    dom.default_cwd = "~"
end

return {
  keys = {
    -- Create a new workspace with a random name and switch to it
    { key = 'i', mods = 'CTRL|SHIFT', action = act.SwitchToWorkspace },
    -- @TODO come up with better keybinds
    { key = 'n', mods = 'CTRL', action = act.SwitchWorkspaceRelative(1) },
    { key = 'p', mods = 'CTRL', action = act.SwitchWorkspaceRelative(-1) },
  },
    
  -- Windows
  wsl_domains = wsl_domains,
  default_domain = is_windows and 'WSL:openSUSE-Tumbleweed' or nil,

  -- Tabs
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- All systems
  font = wezterm.font "Berkeley Mono",
  font_size = is_windows and 16.0 or 18.0,
  font_rules = {
    {
      -- Disable bold fonts
  		intensity = "Bold",
  		italic = false,
  		font = wezterm.font("Berkeley Mono", { intensity = "Normal", stretch = "Normal", style = "Normal" }),
  	},
  },

  -- Disable close prompt
  window_close_confirmation = "NeverPrompt",

  -- Colors
  color_scheme = "Everforest Dark (Gogh)",
  colors = {
    -- https://wezfurlong.org/wezterm/config/appearance.html#tab-bar-appearance-colors
    tab_bar = {
      background = '#2f383e',
      active_tab = {
        bg_color = '#475258',
        fg_color = '#d3c6aa',
      },
      inactive_tab = {
        bg_color = '#2f383e',
        fg_color = '#d3c6aa',
      },
      inactive_tab_hover = {
        bg_color = '#475258',
        fg_color = '#d3c6aa',
      },
    },
  },
}
