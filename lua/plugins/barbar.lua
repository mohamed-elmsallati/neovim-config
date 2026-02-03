local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

return{
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    animation = true,
    mode = "tabs",
    insert_at_start = true,
    maximum_padding = 1,
    separator_style = "slant",
    show_close_icon = false,
    show_buffer_close_icons = false,

    icons = {
      preset = 'default',
      buffer_index = true,
      filetype = {
        enabled = false
      },
    },
    -- …etc.
    --
    map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts),
    map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts),
    map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts),
    map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts),
    map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts),
    map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts),
    map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts),
    map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts),
    map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts),
    map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts),
  },

}
