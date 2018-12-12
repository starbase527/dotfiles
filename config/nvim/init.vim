
" Based on $VIMRUNTIME/vimrc_example.vim:

set nocompatible

set lazyredraw

set ruler
set showcmd
set number
set relativenumber

set splitbelow
set splitright

syntax enable

set noexpandtab ts=4 sts=4 sw=4

" let g:jellybeans_use_term_italic = 1
" let g:jellybeans_overrides = {
" \	'background': {'guibg': '000000'},
" \}

set background=dark
colorscheme solarized

autocmd Filetype ada setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

