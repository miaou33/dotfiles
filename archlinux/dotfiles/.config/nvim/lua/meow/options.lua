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
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

--------------------------------------------------
--					 COLORS						--
--------------------------------------------------
o.termguicolors = true

--------------------------------------------------
--					 CURSOR						--
--------------------------------------------------
-- doesnt change the insert cursor to thin line
o.guicursor = ""

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
o.nu = true
o.relativenumber = true
o.wrap = false
-- set number column width to 2 {default 4}
o.numberwidth = 4

--o.list = false
--o.listchars:append "space:⋅"
--o.listchars:append "eol↴"
--
--require("indent_blankline").setup {
--    space_char_blankline = " ",
--    show_current_context = true,
--    show_current_context_start = true,
--}

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
--					TYPING						--
--------------------------------------------------
-- faster completion (4000ms default)
o.updatetime = 300

-- lunarvim adds
-- pumheight = 10                          -- pop up menu height
