return {
  "mawkler/modicator.nvim",
  dependencies = "folke/tokyonight.nvim",
  init = function()
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {
    show_warnings = false,
    -- Force Modicator to use Tokyo Night's specific colors
    highlights = {
      defaults = {
        bold = true,
      },
    },
    -- Link modes to Tokyo Night's highlight groups
    mode_colors = {
      n = "TokyoNightBlue",   -- Normal
      i = "TokyoNightGreen",  -- Insert
      v = "TokyoNightMagenta",-- Visual
      V = "TokyoNightMagenta",-- Visual Line
      ["\22"] = "TokyoNightMagenta", -- Visual Block
      c = "TokyoNightOrange", -- Command
      s = "TokyoNightRed",    -- Select
      S = "TokyoNightRed",
      ["\19"] = "TokyoNightRed",
      R = "TokyoNightRed",    -- Replace
      r = "TokyoNightRed",
      ["!"] = "TokyoNightRed",
      t = "TokyoNightRed",    -- Terminal
    },
  },
}
