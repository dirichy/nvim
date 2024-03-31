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
lmap("v", function()
  local path = vim.fn.expand("%")
  path = string.gsub(path, "%.[%a]*$", ".pdf")
  require("latex.complite").viewpdf(path)
end, { desc = "View pdf file" })
lmap("f", forwardsearch, { desc = "Forwardsearch" })
lmap("s", function()
  vim.print(require("latex.snip").solveConflict)
end, { desc = "display solved conflict of snips" })
lmap("u", "<cmd>!bypy upload %:p:r.pdf /temp/<cr>", { desc = "Upload to bypy" })
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
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
-- end){
-- local sessionkeys = {
--   { "<leader>qL", require("session_manager").load_session, desc = "Load Session" },
--   { "<leader>qc", require("session_manager").load_current_dir_session, desc = "Load current dir session" },
--   { "<leader>ql", require("session_manager").load_last_session, desc = "Load Last Session" },
--   { "<leader>qs", require("session_manager").save_current_session, desc = "Save Current Session" },
--   { "<leader>qD", require("session_manager").delete_session, desc = "Select and Delete Session" },
--   { "<leader>qd", require("session_manager").delete_current_dir_session, desc = "Select and Delete Session" },
-- }
-- for _, key in ipairs(sessionkeys) do
--   map("n", key[1], key[2], { desc = key.desc })
-- end
vim.cmd("set virtualedit=onemore")
map({ "n", "x", "o" }, "s", function()
  if vim.g.curlang == "zh" then
    require("flash-zh").jump()
  else
    require("flash").jump()
  end
end, { desc = "Flash between Chinese" })
map({ "i" }, "<C-t>", function()
  vim.print(require("cmp").get_entries()[2])
end)
vim.keymap.set("i", "<Space>", function()
  vim.cmd("doautocmd TextChangedI")
  vim.api.nvim_feedkeys(" ", "n", true)
end, { remap = false })
vim.keymap.set("n", "<leader>uc", function()
  require("latex.customconceal")
end)
vim.keymap.set(
  "n",
  "<C-e>",
  "<cmd>echo synIDattr(synID(line('.'), col('.'), 1), 'name')<cr>",
  { noremap = true, silent = false }
)
