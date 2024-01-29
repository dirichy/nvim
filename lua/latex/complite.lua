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
  vim.api.nvim_exec2("w", {})
  local method = get_magic_comment("TEX TS-Program") or "pdf"
  local path = vim.fn.expand("%:p")
  local pdfname = string.gsub(path, "%.tex$", ".pdf")
  pdfname = string.gsub(pdfname, "!", "\\!")
  path = string.gsub(path, "/[^/]*$", "")
  method = compliter[method]
  local output = vim.api.nvim_exec2("!cd " .. path .. ";dirichylog=$(" .. method .. " %:p);echo $?", { output = true })
  local message = string.match(output.output, "\n.\n$")
  message = string.gsub(message, "\n", "")
  if message == "0" then
    vim.api.nvim_exec2("!nohup okular --unique " .. pdfname .. " &", {})
    print("Use " .. method .. " to complite, complite " .. "success. You are good texer!")
  else
    print("Use " .. method .. " to complite, complite " .. "with error, please check the log!")
  end
end
return comp
