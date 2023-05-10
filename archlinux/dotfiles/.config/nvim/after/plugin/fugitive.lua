
--------------------------------------------------
--					 KEYMAPS					--
--------------------------------------------------
local k = vim.keymap.set
k('n', '<leader>gs', vim.cmd.Git)
k('n', '<space>gp', ':Git push<CR>')

