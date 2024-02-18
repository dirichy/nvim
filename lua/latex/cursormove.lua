local tex = require("util.conditions")
local in_cmd = function()
  if tex.in_math then
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
  end
end
