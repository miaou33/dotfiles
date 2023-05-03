--------------------------------------------------
--				INDEX & DEFINES					--
--------------------------------------------------
--colorscheme
--explorers
--git
--lines modifications
--navigation
--search
--yank/past
--windows

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


--------------------------------------------------
--					COLORSCHEME					--
--------------------------------------------------
vim.keymap.set('n', '<leader>cn', ':colo nordic<CR>')
vim.keymap.set('n', '<leader>cb', ':colo boo<CR>')
vim.keymap.set('n', '<leader>cmt', ':lua require("material.functions").find_style()<CR>')

--------------------------------------------------
--					EXPLORERS					--
--------------------------------------------------
-- explorer
vim.keymap.set('n', '<leader>n', vim.cmd.Ex)
-- neotree 
vim.keymap.set('n', '<leader>t', vim.cmd.Neotree)

--------------------------------------------------
--					 GIT						--
--------------------------------------------------
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<space>gp', ':Git push<CR>')

--------------------------------------------------
--					LINES MOD					--
--------------------------------------------------
-- move selected line(s)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- appending below line without placing cursor at the end
vim.keymap.set('n', 'J', "mzJ`z")

-- Reselecting when indenting multiple times
vim.keymap.set('v','<', '<gv')
vim.keymap.set('v', '>', '>gv')

--------------------------------------------------
--				  NAVIGATION					--
--------------------------------------------------
-- moving end of page with recentering
vim.keymap.set('n', 'G', 'Gzz')
-- moving down / up half a page but without changing cursor place
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

--------------------------------------------------
--					 REPLACE					--
--------------------------------------------------
vim.keymap.set('v', 'R', '<Esc>:%s/\\%V/g<left><left>')
--vim.keymap.set('v', 'r', '<Esc>:%s/<C-r>0/g<left><left>')

--------------------------------------------------
--					 SEARCH						--
--------------------------------------------------
-- toggle undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- erase highlight
vim.keymap.set('n', '<leader>he', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-r>', '"y:%s/<C-r>"//g<left><left>')

-- same for results of search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

--------------------------------------------------
--					WINDOWS						--
--------------------------------------------------
-- navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

--------------------------------------------------
--					 YANK/PAST					--
--------------------------------------------------
-- when want to past over a selected portion to replace it, doesnt save the deleted in reg
vim.keymap.set('x', 'p', '"_dP')

-- leader y to yank in system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

