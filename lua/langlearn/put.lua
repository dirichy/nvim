local put = function(envclass, topic, langpath)
  local rootpath = langpath .. "/classes/"
  local name = ""
  for k, v in pairs(envclass) do
    vim.cmd("!mkdir -p" .. rootpath .. k)
    for i, str in ipairs(v) do
      name = string.gsub(str, "^\\begin{word}{([%a]*)}[.\n]*", "\1")
      vim.cmd([[!echo "]] .. str .. [[" > ]] .. rootpath .. k .. "/" .. name .. ".tex")
    end
  end
end
return put
