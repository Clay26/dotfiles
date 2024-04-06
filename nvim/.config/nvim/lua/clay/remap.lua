vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines selected in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor at same spot when using jon
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in middle when navigating search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete word to void register to maintain paste register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Turn off Q
vim.keymap.set("n", "Q", "<nop>")

-- Start sub of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Turn off arrow keys
vim.keymap.set("", "<Left>", "<nop>")
vim.keymap.set("", "<Right>", "<nop>")
vim.keymap.set("", "<Up>", "<nop>")
vim.keymap.set("", "<Down>", "<nop>")

