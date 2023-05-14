--------------------------------------------------
--					  INDEX						--
--------------------------------------------------
--defines
--backups
--colors
--cursor
--indent
--lines
--navigation
--search
--typing
--------------------------------------------------
--					 DEFINES					--
--------------------------------------------------
local o = vim.opt

--------------------------------------------------
--					 BACKUPS					--
--------------------------------------------------
o.swapfile = false
o.backup = false
-- undotree will have access to long running undos
--o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

--------------------------------------------------
--					 COLORS						--
--------------------------------------------------
o.termguicolors = true

--------------------------------------------------
--					 INDENT						--
--------------------------------------------------
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = false

--------------------------------------------------
--					 LINES						--
--------------------------------------------------
o.wrap = false
-- set number column width to 2 {default 4}
-- o.numberwidth = 4

--------------------------------------------------
--			 SIGN & NBR COLUMN					--
--------------------------------------------------
o.nu = true
o.relativenumber = true
-- always show signcolumn
o.signcolumn = "yes"

--------------------------------------------------
--				  NAVIGATION					--
--------------------------------------------------
o.scrolloff = 8
o.sidescrolloff = 8

--------------------------------------------------
--					 SEARCH						--
--------------------------------------------------
o.hlsearch = true
o.incsearch = true

--------------------------------------------------
--					TABS						--
--------------------------------------------------
o.showtabline = 2
o.statusline = ' win_id2tabwin()'

--------------------------------------------------
--					TYPING						--
--------------------------------------------------
-- faster completion (4000ms default)
o.updatetime = 300

