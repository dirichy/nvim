-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd
local cmp = require("cmp")
autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    vim.g.minipairs_disable = true
  end,
})
-- vim.api.nvim_create_autocmd("TextChangedI", {
--   callback = function()
--     local entris = cmp.get_entries()
--     if
--       entris[1] ~= nil
--       and entris[2] == nil
--       and entris[1].source.name == "nvim_lsp"
--       and entris[1].source.source.client.name == "rime_ls"
--     then
--       cmp.confirm({
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = true,
--       })
--     end
--   end,
-- })
