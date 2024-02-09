local M = {}
M.get_word = function()
  return vim.api.nvim_eval("expand('<cword>')")
end
M.update = function(timepath, wordpath, word)
  local time = os.date("%D - %H:%M")
  vim.api.nvim_exec2(
    '!echo "' .. word .. '" > ' .. wordpath .. ';echo "' .. time .. '" > "' .. timepath .. '"',
    { output = true }
  )
end
M.lookup = function()
  local word = M.get_word()
  local timepath = "/var/www/html/latest.txt"
  local wordpath = "/var/www/html/word.txt"
  M.update(timepath, wordpath, word)
end
return M
