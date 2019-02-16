
set nocompatible

set lazyredraw " Assured fast scrolling on big files

set ruler " Show the line and column number of the cursor
set showcmd " Show (partial) command in the last line of the screen
set number " Print the line number in front of each line
set relativenumber " Show the line number relative to the line with the cursor

set splitbelow " Splitting a window will put the new window below
set splitright " Splitting a window will put the new window to the right

set path+=** " See that youtube video

set background=dark " For solarized theme
colorscheme solarized

syntax enable

set textwidth=79 " Split lines at 79 characters
set colorcolumn=80 " Visually highlight 80 column

" Default indentation rules
set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4

" Language-specific indentation rules
autocmd Filetype markdown setlocal expandtab
autocmd Filetype ada setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3
autocmd Filetype make setlocal tabstop=8 shiftwidth=8 softtabstop=8
autocmd Filetype haskell setlocal expandtab tabstop=8 shiftwidth=4 softtabstop=4
autocmd Filetype haskell setlocal shiftround
" let g:python_recommended_style = 0 " Override PEP 8 recommendation
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Kaymappings
nnoremap <silent> <F4> :set cursorline!<CR> " Toggle highlighting current line

