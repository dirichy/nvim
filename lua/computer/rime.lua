local tex = require("util.conditions")
local get_magic_comment = require("latex.get_magic_comment")
local autocmd = vim.api.nvim_create_autocmd
local get_curenv = function()
  if tex.in_math() then
    return "math"
  end
  if tex.in_preamble() then
    return "prea"
  end
  if tex.in_comment() then
    return "comm"
  end
  return "text"
end
autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    local language = get_magic_comment("language") or "en"
    vim.g.curlang = language
    vim.g.custom_rime_enabled = (vim.g.curlang == "zh")
  end,
})

local updateenv = function()
  local nextenv = get_curenv()
  if (vim.g.curenv ~= "text") and (nextenv == "text") then
    vim.cmd("doautocmd User TextEnter")
  end
  if (vim.g.curenv == "text") and (nextenv ~= "text") then
    vim.cmd("doautocmd User TextLeave")
  end
  vim.g.curenv = nextenv
end
autocmd("CursorMovedI", {
  pattern = "*.tex",
  callback = updateenv,
})
autocmd("InsertEnter", {
  pattern = "*.tex",
  callback = updateenv,
})
