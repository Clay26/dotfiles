-- Editor options
vim.o.number = true
vim.o.relativenumber = true

-- Tab spacing options
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.autoindent = true
vim.o.smartindent = true

vim.o.wrap = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.cmd [[syntax enable]]
vim.o.laststatus = 2
vim.o.ruler = true
vim.o.title = true
vim.o.history = 1000
vim.o.textwidth = 0
vim.o.colorcolumn = "+1"

-- Open new split panes to right and bottom, which feels more natural
vim.o.splitbelow = true
vim.o.splitright = true

-- Search options
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true
