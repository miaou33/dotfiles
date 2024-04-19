--------------------------------------------------
--					KEYMAPS						--
--------------------------------------------------

local builtin = require("telescope.builtin")
local k = vim.keymap.set

-- help
k('n', '<leader>mt', builtin.help_tags, {})
k('n', '<leader>ma', builtin.man_pages, {})

k('n', '<leader>cc', builtin.colorscheme, {})
--k('n', '<leader>kk', builtin.keymaps, {})

-- working directory 
k('n', '<leader>pf', builtin.find_files, {})
k('n', '<leader>pw', builtin.live_grep, {})
k('n', '<leader>pg', builtin.git_files, {})
--k('n', '<leader>pb', builtin.buffers, {})

-- lsp through files
k('n', '<leader>fd', builtin.lsp_definitions, {})

-- current buffer
k('n', '<leader>fc', builtin.git_bcommits, {})
k('n', '<leader>fw', builtin.current_buffer_fuzzy_find, {})

-- registers
k('n', '<leader>fr', builtin.registers, {})

--------------------------------------------------
--					SETTINGS					--
--------------------------------------------------

-- settings for grep string
require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--hidden',
		},
	}
}
