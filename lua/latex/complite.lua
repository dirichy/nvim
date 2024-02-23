local compliter = {
  lua = "lualatex",
  lualatex = "lualatex",
  xelatex = "xelatex",
  xe = "xelatex",
  pdelatex = "pdflatex",
  pdf = "pdflatex",
  bibtex = "bibtex",
  bib = "bibtex",
}
local get_magic_comment = require("latex.get_magic_comment")
local M = {}
M.minicomp = function(path)
  vim.api.nvim_exec2("w", {})
  path = string.gsub(path, "/[^/]*$", "")
  local method = get_magic_comment("TEX TS-Program") or "pdf"
  method = compliter[method]
  local output = vim.api.nvim_exec2("!cd " .. path .. ";dirichylog=$(" .. method .. " %:p);echo $?", { output = true })
  print(output)
  local message = string.match(output.output, "\n.\n$")
  message = string.gsub(message, "\n", "")
  if message == "0" then
    print("Use " .. method .. " to complite, complite " .. "success. You are good texer!")
    return 0
  else
    print("Use " .. method .. " to complite, complite " .. "with error, please check the log!")
    return 1
  end
end
M.viewpdf = function(pdfpath)
  vim.api.nvim_exec2("silent !okular " .. pdfpath, {})
end
M.normalcomp = function()
  local path = vim.fn.expand("%:p")
  if M.minicomp(path) == 0 then
    path = string.gsub(path, "%.tex$", ".pdf")
    M.viewpdf(path)
    return 0
  end
  return 1
end
M.fig2tikz = function(figpath)
  return 0
end
M.fullcomp = function()
  local figpath = get_magic_comment("figpath")
  if figpath then
    local path = vim.fn.expand("%:p")
    path = string.gsub(path, "/[^/]*$", "")
    M.fig2tikz(path .. figpath)
  end
end
return M
