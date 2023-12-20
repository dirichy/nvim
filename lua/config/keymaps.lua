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
lmap("b", "<cmd>!mylatex %:p<cr>", { desc = "Build LaTeX file" })
lmap("v", "<cmd>!mytexviewer %:p<cr>", { desc = "View pdf file" })
lmap("f", forwardsearch, { desc = "Forwardsearch" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("i", "<C-z>", "<cmd>normal u<cr>", { desc = "undo" })
map("n", "x", [["_x]], { desc = "delete without yank" })
