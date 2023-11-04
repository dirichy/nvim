local M = {}

local MATH_NODES = {
  displayed_equation = true,
  inline_formula = true,
  math_environment = true,
}

local ts_utils = require("nvim-treesitter.ts_utils")

M.in_env = function(name)
  x, y = vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')")
  return x ~= 0 and y ~= 0
end

M.in_mathzone = function()
  return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end
M.in_text = function()
  return not (vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1)
end
M.in_item = function()
  return M.in_env("itemize") or M.in_env("enumerate")
end
M.in_tikz = function()
  return M.in_env("tikzpicture")
end
M.in_quantikz = function()
  return M.in_env("quantikz")
end

-- For markdown
M.in_latex = function()
  local node = ts_utils.get_node_at_cursor()
  while node do
    if node:type() == "latex_block" then
      print(true)
      return true
    end
    node = node:parent()
  end
  print(false)
  return false
end

M.clean = function()
  local current_dir = vim.fn.expand("%:p:h")
  local file_types = { "aux", "log", "out", "fls", "fdb_latexmk", "bcf", "run.xml", "toc", "DS_Store", "bak*", "dvi" }
  for _, file_type in ipairs(file_types) do
    local command = "rm " .. current_dir .. "/*." .. file_type
    vim.api.nvim_call_function("system", { command })
  end
end

M.format = function()
  local current_file = vim.fn.expand("%:p")
  local latexindent = "latexindent -g /dev/null " .. current_file .. " -wd -l ~/Documents/Latex/latexindent.yaml"
  local build = "pdflatex " .. current_file
  vim.api.nvim_call_function("system", { build })
  vim.cmd("w")
  M.clean()
  vim.api.nvim_call_function("system", { latexindent })
  vim.cmd("e")
  vim.cmd("normal! zz")
  -- vim.cmd("TexlabForward")
end

M.sympy_calc = function()
  local selected_text = vim.fn.getreg("v")
  print(selected_text)
  vim.api.nvim_out_write(selected_text)
end

return M
