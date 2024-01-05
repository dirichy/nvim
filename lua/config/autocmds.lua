-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local tex = require("util.conditions")
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    vim.g.minipairs_disable = true
  end,
})
autocmd("CursorMovedI", {
  pattern = "*.tex",
  callback = function()
    if tex.in_text() then
      vim.cmd("!fcitx-remote -c")
    else
      vim.cmd("!fcitx-remote -o")
    end
  end,
})
autocmd("InsertLeave", {
  pattern = "*.tex",
  callback = function()
    vim.cmd("!fcitx-remote -o")
  end,
})
autocmd("InsertEnter", {
  pattern = "*.tex",
  callback = function()
    if tex.in_text() then
      vim.cmd("!fcitx-remote -c")
    else
      vim.cmd("!fcitx-remote -o")
    end
  end,
})
