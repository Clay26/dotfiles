" Editor options
set number relativenumber
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
syntax enable
set laststatus=2
set ruler
set title
colorscheme desert
set history=1000
set autoindent
set smartindent

" Search options
set hlsearch
set smartcase

" Remapings
" Turn off arrow keys
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>

" Plugin manager
call plug#begin('$HOME/vimfiles/plugged')

Plug 'pprovost/vim-ps1'
