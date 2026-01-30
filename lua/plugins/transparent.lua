return {
	
  "xiyaowong/transparent.nvim",
  opts = {
    groups = {
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
      'EndOfBuffer',
    },

    extra_groups = {
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeCursorLine",
      "lualine",
      "Hierline",
    }, 
    on_clear = function() end,
  }
}
