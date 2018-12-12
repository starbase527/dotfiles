
" Based on $VIMRUNTIME/vimrc_example.vim:

set nocompatible

set lazyredraw

set ruler
set showcmd
set number
set relativenumber

set splitbelow
set splitright

set path+=**

" let g:jellybeans_use_term_italic = 1
" let g:jellybeans_overrides = {
" \	'background': {'guibg': '000000'},
" \}

set background=dark
colorscheme solarized

syntax enable

set textwidth=79
set colorcolumn=80
set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
let g:python_recommended_style = 0

autocmd Filetype markdown setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype ada setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype make setlocal tabstop=8 shiftwidth=8 softtabstop=8
autocmd Filetype haskell setlocal expandtab tabstop=8 shiftwidth=4 softtabstop=4
autocmd Filetype haskell setlocal shiftround

