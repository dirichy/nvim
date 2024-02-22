local tex = require("util.conditions")
local autocmd = vim.api.nvim_create_autocmd
autocmd("CursorMovedI", {
  pattern = "*.tex",
  callback = function()
    if tex.in_text() then
      vim.cmd("silent !nohup fcitx-remote -o > /dev/null")
    else
      vim.cmd("silent !nohup fcitx-remote -c > /dev/null")
    end
  end,
})
autocmd("InsertLeave", {
  pattern = "*.tex",
  callback = function()
    vim.cmd("silent !fcitx-remote -c")
  end,
})
autocmd("InsertEnter", {
  pattern = "*.tex",
  callback = function()
    if tex.in_text() then
      vim.cmd("silent !fcitx-remote -o")
    else
      vim.cmd("silent !fcitx-remote -c")
    end
  end,
})
