return {
  {
    "lervag/vimtex",
    ft = "tex",
    priority = 1001,
    config = function()
      vim.cmd([[
      " This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" let g:vimtex_view_method = 'okular'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'
    " let g:vimtex_syntax_conceal = {
    "       \ 'accents': 0,
    "       \ 'ligatures': 0,
    "       \ 'cites': 0,
    "       \ 'fancy': 0,
    "       \ 'spacing': 0,
    "       \ 'greek': 0,
    "       \ 'math_bounds': 0,
    "       \ 'math_delimiters': 0,
    "       \ 'math_fracs': 0,
    "       \ 'math_super_sub': 0,
    "       \ 'math_symbols': 0,
    "       \ 'sections': 0,
    "       \ 'styles': 0,
    "       \}
" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = "\\"
set conceallevel=2
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()
let g:vimtex_ui_method = {
      \ 'confirm': 'nvim',
      \ 'input': 'nvim',
      \ 'select': 'nvim',
      \}
      ]])
    end,
  },
}
