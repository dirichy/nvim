-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd([[
let g:vimtex_syntax_custom_cmds = [
  \ {'name': 'mathcal', 'mathmode': 1, 'conceal': 1, 'argstyle': 'bold'},
  \ {'name': 'ide', 'mathmode': 1, 'conceal': 1, 'concealchar':'𝕀'},
  \ {'name': 'van', 'mathmode': 1, 'conceal': 1, 'concealchar':'𝕍'},
  \ {'name': 'overline', 'mathmode': 1, 'conceal': 1,'concealchar': '‾'},
  \]
]])
vim.cmd([[
let g:vimtex_syntax_custom_cmds_with_concealed_delims = [
  \ {'name': 'ket', 'mathmode': 1, 'cchar_open': '|', 'cchar_close': '>'},
  \ {'name': 'bra', 'mathmode': 1, 'cchar_open': '<', 'cchar_close': '|'},
  \ {'name': 'abs', 'mathmode': 1, 'cchar_open': '|', 'cchar_close': '|'},
  \ {'name': 'norm', 'mathmode': 1, 'cchar_open': '⫼', 'cchar_close': '⫼'},
  \ {'name': 'ceil', 'mathmode': 1, 'cchar_open': '⌈', 'cchar_close': '⌉'},
  \ {'name': 'floor', 'mathmode': 1, 'cchar_open': '⌊', 'cchar_close': '⌋'},
  \ {'name': 'overline', 'mathmode': 1, 'cchar_open': '‾', 'cchar_close': '‾'},
  \]
]])
