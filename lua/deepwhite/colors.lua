-- Flatwhite: Muted pastel color palette
local M = {}

-- Background shades (light theme)
M.bg = {
  base = "#ffffff",
  muted = "#f7f3ee",
  highlight = "#f1ece4",
  visual = "#dcd3c6",
  cursor_line = "NONE",
  darkest = "#4a4540",
}

-- Bright/foreground colors
M.fg = {
  base = "#605a52",
  muted = "#93836c",
  dim = "#b9a992",
  line_nr = "#93836c",
}

-- Accent colors (saturated)
M.accent = {
  green = "#465953",
  green_light = "#525643",
  green_pastel = "#5f8c7d",
  
  yellow = "#a9994c",
  yellow_dark = "#5b5143",
  
  purple = "#614c61",
  purple_med = "#9c739c",
  
  blue = "#7382a0",
  blue_dark = "#4c5361",
  
  red = "#5b4343",
  red_med = "#955f5f",
}

-- Pastel backgrounds for syntax highlighting
M.pastel = {
  green = "#d2ebe3",
  green_light = "#e2e9c1",
  
  yellow = "#f7e0c3",
  yellow_light = "#f5edc7",
  
  purple = "#f1ddf1",
  
  blue = "#dde4f2",
  
  red = "#f6cfcb",
}

-- Build flat color names from semantic groups
function M.build_colors(opts)
  opts = opts or {}
  
  return {
    -- Backgrounds
    bg = opts.transparent and "NONE" or M.bg.base,
    bg_muted = M.bg.muted,
    bg_highlight = M.bg.highlight,
    bg_visual = M.bg.visual,
    bg_cursor_line = M.bg.cursor_line,
    bg_darkest = M.bg.darkest,
    
    -- Foregrounds
    fg = M.fg.base,
    fg_muted = M.fg.muted,
    fg_dim = M.fg.dim,
    fg_line_nr = M.fg.line_nr,
    
    -- Greens
    green = M.accent.green,
    green_light = M.accent.green_light,
    green_pastel = M.accent.green_pastel,
    pastel_green = M.pastel.green,
    pastel_green_light = M.pastel.green_light,
    
    -- Yellows
    yellow = M.accent.yellow,
    yellow_dark = M.accent.yellow_dark,
    pastel_yellow = M.pastel.yellow,
    pastel_yellow_light = M.pastel.yellow_light,
    
    -- Purples
    purple = M.accent.purple,
    purple_med = M.accent.purple_med,
    pastel_purple = M.pastel.purple,
    
    -- Blues
    blue = M.accent.blue,
    blue_dark = M.accent.blue_dark,
    pastel_blue = M.pastel.blue,
    
    -- Reds
    red = M.accent.red,
    red_med = M.accent.red_med,
    pastel_red = M.pastel.red,
    
    -- White
    white = "#ffffff",
  }
end

return M
