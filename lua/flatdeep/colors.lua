-- FlatDeep: Color palette variants
local M = {}

-- Default variant (original flatdeep - light theme with vibrant colors)
M.variants = {
  default = {
    bg = {
      base = "#FAF2EB",
      muted = "#E6E4DF",
      highlight = "#CCCBC6",
      visual = "#B3B1AD",
      cursor_line = "#B3B1AD",
      darkest = "#1A1918",
    },
    fg = {
      base = "#595855",
      muted = "#807E79",
      dim = "#999791",
      line_nr = "#807E79",
    },
    accent = {
      green = "#00A600",
      green_light = "#00A600",
      green_pastel = "#00A6A6",
      yellow = "#b0801f",
      yellow_dark = "#F27900",
      purple = "#6F00A6",
      purple_med = "#907aa9",
      blue = "#0000A6",
      blue_dark = "#0000A6",
      red = "#A60000",
      red_med = "#A6006F",
    },
    pastel = {
      green = "#D4FAD4",
      green_light = "#D4FAD4",
      yellow = "#FAFAC8",
      yellow_light = "#FAE1C8",
      purple = "#EDD4FA",
      blue = "#D4D4FA",
      red = "#FAD4D4",
    },
  },
  
  -- Flatwhite variant (muted earth tones - light theme)
  flatwhite = {
    bg = {
      base = "#ffffff",
      muted = "#f7f3ee",
      highlight = "#f1ece4",
      visual = "#dcd3c6",
      cursor_line = "NONE",
      darkest = "#4a4540",
    },
    fg = {
      base = "#605a52",
      muted = "#93836c",
      dim = "#b9a992",
      line_nr = "#93836c",
    },
    accent = {
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
    },
    pastel = {
      green = "#d2ebe3",
      green_light = "#e2e9c1",
      yellow = "#f7e0c3",
      yellow_light = "#f5edc7",
      purple = "#f1ddf1",
      blue = "#dde4f2",
      red = "#f6cfcb",
    },
  },
  
}

-- Get current variant colors
M.current = M.variants.default

-- Set variant
function M.set_variant(name)
  if M.variants[name] then
    M.current = M.variants[name]
  else
    print("Unknown variant: " .. name .. ". Available: default, flatwhite")
  end
end

-- Build flat color names from semantic groups
function M.build_colors(opts)
  opts = opts or {}
  
  -- Resolve variant: if string, look it up; otherwise use current
  local v
  if type(opts.variant) == "string" then
    v = M.variants[opts.variant] or M.current
  else
    v = M.current
  end
  
  return {
    -- Backgrounds
    bg = opts.transparent and "NONE" or v.bg.base,
    bg_muted = v.bg.muted,
    bg_highlight = v.bg.highlight,
    bg_visual = v.bg.visual,
    bg_cursor_line = v.bg.cursor_line,
    bg_darkest = v.bg.darkest,
    
    -- Foregrounds
    fg = v.fg.base,
    fg_muted = v.fg.muted,
    fg_dim = v.fg.dim,
    fg_line_nr = v.fg.line_nr,
    
    -- Greens
    green = v.accent.green,
    green_light = v.accent.green_light,
    green_pastel = v.accent.green_pastel,
    pastel_green = v.pastel.green,
    pastel_green_light = v.pastel.green_light,
    
    -- Yellows
    yellow = v.accent.yellow,
    yellow_dark = v.accent.yellow_dark,
    pastel_yellow = v.pastel.yellow,
    pastel_yellow_light = v.pastel.yellow_light,
    
    -- Purples
    purple = v.accent.purple,
    purple_med = v.accent.purple_med,
    pastel_purple = v.pastel.purple,
    
    -- Blues
    blue = v.accent.blue,
    blue_dark = v.accent.blue_dark,
    pastel_blue = v.pastel.blue,
    
    -- Reds
    red = v.accent.red,
    red_med = v.accent.red_med,
    pastel_red = v.pastel.red,
    
    -- White
    white = "#ffffff",
  }
end

return M
