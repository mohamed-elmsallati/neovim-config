-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
    event = { "BufReadPre" },
    autotag = {
      enable = true,
      enable_rename = true,
    },
  },
}
