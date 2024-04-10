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


local home = os.getenv("HOME") or os.getenv("USERPROFILE") -- Works for both Unix-like systems and Windows
local pathSeparator = package.config:sub(1,1) -- Gets the path separator from Lua's package config, which is '/' on Unix-like and '\' on Windows
local undodir = home .. pathSeparator .. ".vim" .. pathSeparator .. "undodir"
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = undodir
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
