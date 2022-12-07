local wezterm = require 'wezterm'

local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
local wsl_domains = wezterm.default_wsl_domains()


-- https://wezfurlong.org/wezterm/config/lua/wezterm/hostname.html
for _, dom in ipairs(wsl_domains) do
    dom.default_cwd = "~"
end

return {
    -- Windows
    default_domain = is_windows and 'WSL:openSUSE-Tumbleweed' or nil,
    wsl_domains = wsl_domains,

    -- Tabs
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    switch_to_last_active_tab_when_closing_tab = true,

    -- All systems
    font = wezterm.font "Berkeley Mono",
    font_size = is_windows and 16.0 or 18.0,

    -- Other gruvbox theme has incorrect background color
    color_scheme = "Gruvbox dark, hard (base16)",

    -- Disable close prompt
    window_close_confirmation = "NeverPrompt"
}
