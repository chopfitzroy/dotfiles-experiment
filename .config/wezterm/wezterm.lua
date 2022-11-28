local wezterm = require 'wezterm'

local wsl_domains = wezterm.default_wsl_domains()

-- @TODO only load on Windows
-- https://wezfurlong.org/wezterm/config/lua/wezterm/hostname.html
for _, dom in ipairs(wsl_domains) do
    dom.default_cwd = "~"
end

-- May need this for Powerline
-- font = wezterm.font_with_fallback {"Berkeley Mono", "Symbols Nerd Font Mono"},

return {
    -- @TODO only load on Windows
    -- https://wezfurlong.org/wezterm/config/lua/wezterm/hostname.html
    -- default_domain = 'WSL:openSUSE-Tumbleweed',
    wsl_domains = wsl_domains,
    -- Tabs
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    -- All systems
    font = wezterm.font "Berkeley Mono",
    font_size = 18.0,
    -- Other gruvbox theme has incorrect background color
    color_scheme = "Gruvbox dark, hard (base16)",
    -- Disable close prompt
    window_close_confirmation = "NeverPrompt"
}
