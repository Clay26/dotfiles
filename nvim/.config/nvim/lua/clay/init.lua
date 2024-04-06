require("clay.remap")


-- Editor options
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.cmd [[syntax enable]]
vim.o.laststatus = 2
vim.o.ruler = true
vim.o.title = true
vim.o.history = 1000
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.textwidth = 80
vim.o.colorcolumn = "+1"

-- Open new split panes to right and bottom, which feels more natural
vim.o.splitbelow = true
vim.o.splitright = true

-- Search options
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
