-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
local function forwardsearch()
  local line = vim.api.nvim_eval("line('.')")
  local col = vim.api.nvim_eval("col('.')")
  vim.cmd("!myforwardsearch " .. vim.fn.expand("%:p") .. " " .. line .. " " .. col)
end
local lp = "<leader>t"
local lmap = function(key, cmd, opts)
  map("n", lp .. key, cmd, opts)
end
lmap("b", require("latex.complite").normalcomp, { desc = "build latex file" })
lmap("B", require("latex.complite").fullcomp, { desc = "Build LaTeX file" })
lmap("v", require("latex.complite").viewpdf, { desc = "View pdf file" })
lmap("f", forwardsearch, { desc = "Forwardsearch" })
lmap("s", function()
  vim.print(require("latex.snip").solveConflict)
end, { desc = "display solved conflict of snips" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("i", "<C-z>", "<cmd>normal u<cr>", { desc = "undo" })
map("i", "<C-v>", "<cmd>normal hpl<cr>", { desc = "paste" })
map("n", "x", [["_x]], { desc = "delete without yank" })
-- map("i", "<c-g>", function()
--   local position = vim.api.nvim_win_get_cursor(0)
--   local params = {
--     textDocument = {
--       uri = vim.uri_from_bufnr(0),
--     },
--     position = {
--       line = position[1] - 1,
--       character = position[2] - 1,
--     },
--   }
--   local rsult = vim.lsp.buf_request_sync(0, "textDocument/hover", params, 100)
--   vim.print(rsult)
-- end)
