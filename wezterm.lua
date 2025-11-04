local wezterm = require 'wezterm'
local config = {}

-- Put tabs in the title bar (macOS style)

-- Tab bar settings
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true  -- Must be true for black title bar
config.tab_bar_at_bottom = true  -- Title bar tabs must be at bottom
config.hide_tab_bar_if_only_one_tab = false

-- Set window width and height
config.initial_cols = 92
config.initial_rows = 61

-- Set font and size
config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.0

-- Set margins
config.window_padding = {
    left = 0,
    right = 0,
    top = 15,
    bottom = 0,
}

-- Disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- Pure minimal black theme
config.colors = {
    background = '#000000',
    foreground = '#ffffff',
  
    tab_bar = {
        background = '#000000',
        active_tab = {
            bg_color = '#1a1a1a',
            fg_color = '#ffffff',
        },
        inactive_tab = {
            bg_color = '#000000',
            fg_color = '#666666',
        },
    },
}

config.keys = {
    {
        key = 'LeftArrow', mods = 'CMD|SHIFT', 
        action = wezterm.action.MoveTabRelative(-1)
    },
    {
        key = 'RightArrow', mods = 'CMD|SHIFT',
        action = wezterm.action.MoveTabRelative(1)
    },
}

-- Performance
config.front_end = "WebGpu"  -- GPU acceleration

return config
