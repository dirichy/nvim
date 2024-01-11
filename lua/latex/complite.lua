local compliter = {
  xelatex = "xelatex",
  xe = "xelatex",
  pdelatex = "pdflatex",
  pdf = "pdflatex",
  bibtex = "bibtex",
  bib = "bibtex",
}
local comp = function()
  local method = "pdf"
  local i = 0
  while true do
    local line = vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1]
    if string.match(line, "^%%!") then
      line = string.lower(line)
      if string.match(line, "tex ts%-program") then
        method = string.match(line, "[^ =]*$")
        break
      end
      i = i + 1
    else
      break
    end
  end
  local path = vim.fn.expand("%:p")
  path = string.gsub(path, "/[^/]*$", "")
  method = compliter[method]
  print("use " .. method .. " to complite!")
  i = vim.api.nvim_exec("!cd " .. path .. ";log=$(" .. method .. " %:p);echo $?", { output = true })
  print(i)
end
return comp
