" Plugin manager
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-abolish'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

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
set background=dark
colorscheme desert
set history=1000
set autoindent
set smartindent
set laststatus=2
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Search options
set hlsearch
set ignorecase
set smartcase

" Remapings
" Turn off arrow keys
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
