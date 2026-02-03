return {
  "xiyaowong/transparent.nvim",
  opts = {
    groups = {
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr','LineNrAbove', 'LineNrBelow', 'NonText',
      'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC','FoldColumn', 'Folded',
      'EndOfBuffer',
    },
    extra_groups = {

      "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeWinSeparator",
      
      -- Barbar (The tabs at the top)
      "BufferCurrent", "BufferCurrentIndex", "BufferCurrentMod", "BufferCurrentSign", "BufferCurrentTarget",
      "BufferInactive", "BufferInactiveIndex", "BufferInactiveMod", "BufferInactiveSign", "BufferInactiveTarget",
      "BufferVisible", "BufferVisibleIndex", "BufferVisibleMod", "BufferVisibleSign", "BufferVisibleTarget",
      "BufferTabpages", "BufferTabpageFill","BufferSeparator",
      "BufferTabpagesSeparator","BufferOffset",

      -- Lualine (The status bar at the bottom)
      "lualine_a_normal", "lualine_b_normal", "lualine_c_normal",
      "WinSeparator", 
      'Folded',
      "VertSplit", 
      "FoldColumn",
      "EndOfBuffer",
      "HeirlineStatusLine",
      "HeirlineStatusColumn",
      "HeirlineWinBar",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
    },
    exclude_groups = { "NormalFloat", "FloatBorder" },
  },
config = function(_, opts)
    require("transparent").setup(opts)
    
    -- This clears Barbar, Lualine, and the Sidebar areas
    require("transparent").clear_prefix("Buffer")
    require("transparent").clear_prefix("lualine")
    require("transparent").clear_prefix("NeoTree")
    require("transparent").clear_prefix("SignColumn")
    require("transparent").clear_prefix("LineNr")
    require("transparent").clear_prefix("Fold")
    require("transparent").clear_prefix("Heirline")
    require("transparent").clear_prefix("TabLine")
  end
}
