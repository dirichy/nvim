local async = require("plenary.async")
local cmd = require("util").cmd
local compliter = {
  lua = "lualatex",
  lualatex = "lualatex",
  xelatex = "xelatex",
  xe = "xelatex",
  pdflatex = "pdflatex",
  pdf = "pdflatex",
  bibtex = "bibtex",
  bib = "bibtex",
}
local get_magic_comment = require("latex.get_magic_comment")
local M = {}
M.minicomp = function(path)
  vim.api.nvim_exec2("w", {})
  local file = path
  path = string.gsub(path, "/[^/]*$", "")
  local method = get_magic_comment("TEX TS-Program") or "pdf"
  method = compliter[method]
  local message = cmd("cd " .. path .. ";dirichylog=$(" .. method .. " " .. file .. ");echo $?")
  if tonumber(message) == 0 then
    print("Use " .. method .. " to complite, complite " .. "success. You are good texer!")
    return 0
  else
    print("Use " .. method .. " to complite, complite " .. "with error, please check the log!")
    return 1
  end
end
if vim.g.ssh then
  M.viewpdf = function(path)
    vim.cmd([[!cp -f ]] .. path .. [[ ~/temp.pdf]])
    vim.cmd([[!md5sum ~/temp.pdf > ~/temp.md5]])
    return true
  end
elseif vim.g.systemos == "macOS" then
  M.viewpdf = function(path)
    vim.api.nvim_exec2("!nohup zathura " .. path .. " > /dev/null &", {})
  end
elseif vim.g.systemos == "Linux" then
  M.viewpdf = function(path)
    cmd("nohup okular --unique " .. path .. " > /dev/null &")
  end
end
M.normalcomp = async.void(function()
  local path = vim.fn.expand("%:p")
  if M.minicomp(path) == 0 then
    path = string.gsub(path, "%.tex$", ".pdf")
    M.viewpdf(path)
  end
end)
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
