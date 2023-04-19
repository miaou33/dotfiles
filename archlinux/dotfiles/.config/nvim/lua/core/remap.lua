
--------------------------------------------------
--					 DEFINES					--
--------------------------------------------------
-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--------------------------------------------------
--					EXPLORERS					--
--------------------------------------------------
-- explorer
vim.keymap.set('n', '<leader>n', vim.cmd.Ex)
-- neotree 
vim.keymap.set('n', '<leader>t', vim.cmd.Neotree)

--------------------------------------------------
--					 FIND						--
--------------------------------------------------
-- erase highlight
vim.keymap.set('n', '<leader>he', ':nohlsearch<CR>')
-- vim.keymap.set('n', '<C-r>', '"y:%s/<C-r>"/g<left><left><left>')

--------------------------------------------------
--					 GIT						--
--------------------------------------------------
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<space>gp", ":!git push<CR>")

--------------------------------------------------
--				  VISUAL MODE					--
--------------------------------------------------
-- move selected line(s)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- appending below line without placing cursor at the end
vim.keymap.set("n", "J", "mzJ`z")

-- Reselecting when indenting multiple times
vim.keymap.set("v","<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- moving end of page with recentering
vim.keymap.set("n", "G", "Gzz")
-- moving down / up half a page but without changing cursor place
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- same for results of search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- when want to past over a selected portion to replace it, doesnt save the deleted in reg
vim.keymap.set("x", "<leader>p", "\"_dP")

-- leader y to yank in system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--------------------------------------------------
--					WINDOWS						--
--------------------------------------------------
-- navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- resize
-- vim.keymap.set('n', '<C-<>', '<C-w><')
-- vim.keymap.set('n', '<C->>', '<C-w>>')
-- vim.keymap.set('n', '<C-->', '<C-w>-')
-- vim.keymap.set('n', '<C-+>', '<C-w>+')


