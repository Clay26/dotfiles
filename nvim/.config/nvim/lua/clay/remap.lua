vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Turn off arrow keys
vim.api.nvim_set_keymap('', '<Left>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Right>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Up>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Down>', '<nop>', {noremap = true})

