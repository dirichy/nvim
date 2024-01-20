local compliter = {
  xelatex = "xelatex",
  xe = "xelatex",
  pdelatex = "pdflatex",
  pdf = "pdflatex",
  bibtex = "bibtex",
  bib = "bibtex",
}
local get_magic_comment = require("latex.get_magic_comment")
local comp = function()
  local method = get_magic_comment("TEX TS-Program") or "pdf"
  local path = vim.fn.expand("%:p")
  path = string.gsub(path, "/[^/]*$", "")
  method = compliter[method]
  local output = vim.api.nvim_exec2("!cd " .. path .. ";dirichylog=$(" .. method .. " %:p);echo $?", { output = true })
  local message = string.match(output.output, "\n.\n$")
  message = string.gsub(message, "\n", "")
  print("Use " .. method .. " to complite, complite " .. (message == "0" and "success" or "unsuccess"))
end
return comp
