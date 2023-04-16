
-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- explorer
vim.keymap.set('n', '<leader>n', vim.cmd.Ex)

-- erase highlight
vim.keymap.set('n', '<leader>he', ':nohlsearch<CR>')

-- navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
