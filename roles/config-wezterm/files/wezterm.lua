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
  default_domain = is_windows and 'WSL:openSUSE-Tumbleweed' or nil,
  wsl_domains = wsl_domains,

  -- Tabs
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- All systems
  font = wezterm.font "Berkeley Mono",
  font_size = is_windows and 16.0 or 18.0,
  color_scheme = "Oxocarbon Dark",

  -- Disable close prompt
  window_close_confirmation = "NeverPrompt"
}
