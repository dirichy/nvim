vim.cmd([[
let g:vimtex_syntax_custom_cmds = [
  \ {'name': 'mathcal', 'mathmode': 1, 'conceal': 1, 'argstyle': 'bold'},
  \ {'name': 'mathscr', 'mathmode': 1, 'conceal': 1, 'argstyle': 'bold'},
  \ {'name': 'mathbbm', 'mathmode': 1, 'conceal': 1, 'argstyle': 'bold'},
  \ {'name': 'ide', 'mathmode': 1, 'conceal': 1, 'concealchar':'𝕀'},
  \ {'name': 'van', 'mathmode': 1, 'conceal': 1, 'concealchar':'𝕍'},
  \ {'name': 'iff', 'mathmode': 1, 'conceal': 1, 'concealchar':'⬌'},
  \ {'name': 'Rightarrow', 'mathmode': 1, 'conceal': 1, 'concealchar':'➡'},
  \ {'name': 'Leftarrow', 'mathmode': 1, 'conceal': 1, 'concealchar':'⬅'},
  \ {'name': 'varnothing', 'mathmode': 1, 'conceal': 1, 'concealchar':'∅'},
  \ {'name': 'upharpoonleft', 'mathmode': 1, 'conceal': 1, 'concealchar':'↿'},
  \ {'name': 'upharpoonright', 'mathmode': 1, 'conceal': 1, 'concealchar':'↾'},
  \ {'name': 'downharpoonleft', 'mathmode': 1, 'conceal': 1, 'concealchar':'⇃'},
  \ {'name': 'downharpoonright', 'mathmode': 1, 'conceal': 1, 'concealchar':'⇂'},
  \ {'name': 'rightharpoonup', 'mathmode': 1, 'conceal': 1, 'concealchar':'⇀'},
  \ {'name': 'leftharpoonup', 'mathmode': 1, 'conceal': 1, 'concealchar':'↽'},
  \ {'name': 'rightharpoondown', 'mathmode': 1, 'conceal': 1, 'concealchar':'⇁'},
  \ {'name': 'leftharpoondown', 'mathmode': 1, 'conceal': 1, 'concealchar':'↽'},
  \ {'name': 'implies', 'mathmode': 1, 'conceal': 1, 'concealchar':'➡'},
  \ {'name': 'impliedby', 'mathmode': 1, 'conceal': 1, 'concealchar':'⬅'},
  \ {'name': 'AND', 'mathmode': 1, 'conceal': 1, 'concealchar':'∧'},
  \ {'name': 'OR', 'mathmode': 1, 'conceal': 1, 'concealchar':'∨'},
  \]
]])
vim.cmd([[
let g:vimtex_syntax_custom_cmds_with_concealed_delims = [
  \ {'name': 'ket', 'mathmode': 1, 'cchar_open': '|', 'cchar_close': '>'},
  \ {'name': 'bra', 'mathmode': 1, 'cchar_open': '<', 'cchar_close': '|'},
  \ {'name': 'abs', 'mathmode': 1, 'cchar_open': '|', 'cchar_close': '|'},
  \ {'name': 'norm', 'mathmode': 1, 'cchar_open': '‖', 'cchar_close': '‖'},
  \ {'name': 'ceil', 'mathmode': 1, 'cchar_open': '⌈', 'cchar_close': '⌉'},
  \ {'name': 'floor', 'mathmode': 1, 'cchar_open': '⌊', 'cchar_close': '⌋'},
  \ {'name': 'overline', 'mathmode': 1, 'cchar_open': '‾', 'cchar_close': '‾'},
  \ {'name': 'fun', 'mathmode': 1, 'nargs':2,'cchar_open': '{', 'cchar_mid':'↝','cchar_close': '}'},
  \ {'name': 'Cref', 'mathmode': 0, 'nargs':1,'cchar_open': '🔍','cchar_close': '🔍','argstyle':'bold'},
  \ {'name': 'label', 'mathmode': 0, 'nargs':1,'cchar_open': '📎','cchar_close': '📎','argstyle':'bold'},
  \ {'name': 'label', 'mathmode': 1, 'nargs':1,'cchar_open': '📎','cchar_close': '📎','argstyle':'bold'},
  \ {'name': 'res', 'mathmode': 1, 'nargs':2, 'cchar_mid':'↾',},
  \ {'name': 'frac', 'mathmode': 1, 'nargs':2,'cchar_open': '⦑', 'cchar_mid':'/','cchar_close': '⦒'},
  \]
]])
