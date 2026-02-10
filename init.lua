local lazypath = vim.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"
if vim.fn.has('linux') == 1 then
    vim.g.clipboard = {
        name = 'xsel_copyq',
        copy = {
            ['+'] = 'copyq add -',
            ['*'] = 'copyq add -',
        },
        paste = {
            ['+'] = 'copyq read 0',
            ['*'] = 'copyq read 0',
        },
        cache_enabled = 1,
    }
end
-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')


require "lazy_setup"
require "polish"
