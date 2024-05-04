"not compatible with vi or vim
set nocompatible
filetype off

syntax on

" set python
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

" set clipboard
set clipboard=unnamedplus

" do plugins
source $HOME/.config/nvim/plugins.vim

"colorscheme solarized
map <silent> <C-n> :NERDTreeFocus<CR>

"terminal title set as file name
set title
"text wrapping won't cut words
set linebreak

"tabs
set expandtab
set tabstop=4
set shiftwidth=4

"code folding
set smartindent
set foldenable
set foldmethod=indent
set foldlevel=99

"line numbers etc
set number relativenumber
set cursorline

"nnoremap \ :te<enter>
"nnoremap <f6> <esc>:w<enter>:!g++ -std+c++11 %<enter>
