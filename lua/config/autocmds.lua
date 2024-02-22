-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    vim.g.minipairs_disable = true
  end,
})
autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    local lang = require("latex.get_magic_comment")("Language") or "en"
    if lang == "zh" then
      pcall(require, "computer.rime")
      vim.api.nvim_exec2('let g:dirichy_language="' .. lang .. '"', {})
    end
  end,
})
