
-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "tokyonight",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = {
        -- This kills the background for the status column and winbar
        StatusColumn = { bg = "NONE" },
        WinBar = { bg = "NONE" },
        WinBarNC = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        FoldColumn = { bg = "NONE" },
        CursorLineNr = { bg = "NONE" },
        LineNr = { bg = "NONE" },
        -- Fixes the vertical split line background
        WinSeparator = { bg = "NONE" },
        -- Force the tabline and its filler space to be transparent
        BufferCurrent = { bg = "#3b4252", fg = "#7aa2f7", bold = true },
        BufferCurrentIndex = { bg = "#3b4252", fg = "#7aa2f7" },
        BufferCurrentMod = { bg = "#3b4252", fg = "#e0af68" },
        BufferCurrentSign = { bg = "#3b4252", fg = "#7aa2f7" },

        -- The slanted 'arrow' part for the current tab
        BufferCurrentTarget = { bg = "#3b4252", fg = "#f7768e" },

        -- Inactive tabs (darker background)
        BufferInactive = { bg = "#1a1b26", fg = "#565f89" },
        BufferInactiveIndex = { bg = "#1a1b26", fg = "#565f89" },
        BufferInactiveSign = { bg = "#1a1b26", fg = "#565f89" },
        -- If there's a line under the tabs, this clears it
        TabLineSel = { bg = "NONE" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
