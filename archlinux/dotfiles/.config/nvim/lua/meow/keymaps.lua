--------------------------------------------------
--				INDEX & DEFINES					--
--------------------------------------------------
--buffers
--colorscheme
--explorers
--git
--lines modifications
--navigation through text
--search
--yank/past
--windows

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local k = vim.keymap.set

-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


--------------------------------------------------
--					  BUFFERS					--
--------------------------------------------------
k('n', '<leader>b', ':b#<CR>')

--------------------------------------------------
--					COLORSCHEME					--
--------------------------------------------------
k('n', '<leader>cmt', ':lua require("material.functions").find_style()<CR>')
k('n', '<leader>cb', ':lua ColorTB ()<CR>')
k('n', '<leader>tb', ':lua ColorTB ()<left>')

--------------------------------------------------
--					EXPLORERS					--
--------------------------------------------------
-- explorer
k('n', '<leader>n', vim.cmd.Ex)
-- neotree 
k('n', '<leader>t', vim.cmd.Neotree)

--------------------------------------------------
--					 GIT						--
--------------------------------------------------
k('n', '<leader>gs', vim.cmd.Git)
k('n', '<space>gp', ':Git push<CR>')

--------------------------------------------------
--					LINES MOD					--
--------------------------------------------------
-- move selected line(s)
k('v', 'J', ":m '>+1<CR>gv=gv")
k('v', 'K', ":m '<-2<CR>gv=gv")

-- appending below line without placing cursor at the end
k('n', 'J', "mzJ`z")

-- Reselecting when indenting multiple times
k('v','<', '<gv')
k('v', '>', '>gv')

--------------------------------------------------
--				  NAVIGATION					--
--------------------------------------------------
-- moving end of page with recentering
k('n', 'G', 'Gzz')
-- moving down / up half a page but without changing cursor place
k('n', '<C-d>', '<C-d>zz')
k('n', '<C-u>', '<C-u>zz')

--------------------------------------------------
--					 REPLACE					--
--------------------------------------------------
k('v', 'R', '<Esc>:%s/\\%V/g<left><left>')
-- > replace in current buffer only selected part
--
--		Before block with old and sold.
-- 		First told abc old sold gold.
-- 		Another is old, gold but not cold.
-- 		Last is older, fold not bold.
-- 		After block with fold and older and bold.
--
-- 		select lines in the middle then <Esc> :%s/\%Vold/NEW/g

k('v', 'r', 'y<Esc>:%s/<C-r>"//g<left><left>')
-- > replace all occurrences of selection in file
--k('n', 'r', '"y:%s/<C-r>"//g<left><left>')
-- > replace all occurrences of last yanked in file

--------------------------------------------------
--					 SEARCH						--
--------------------------------------------------
-- toggle undotree
k("n", "<leader>u", vim.cmd.UndotreeToggle)

-- erase highlight
k('n', '<leader>he', ':nohlsearch<CR>')

-- same for results of search
k('n', 'n', 'nzzzv')
k('n', 'N', 'Nzzzv')

--------------------------------------------------
--					WINDOWS						--
--------------------------------------------------
-- navigation
k('n', '<C-h>', '<C-w>h')
k('n', '<C-j>', '<C-w>j')
k('n', '<C-k>', '<C-w>k')
k('n', '<C-l>', '<C-w>l')

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

--------------------------------------------------
--					 YANK/PAST					--
--------------------------------------------------
-- when want to past over a selected portion to replace it, doesnt save the deleted in reg
k('x', 'p', '"_dP')

-- leader y to yank in system clipboard
k({'n', 'v'}, '<leader>y', [["+y]])
k('n', '<leader>Y', [["+Y]])

