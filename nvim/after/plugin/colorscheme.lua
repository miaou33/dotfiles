--------------------------------------------------
--				INDEX & DEFINES					--
--------------------------------------------------
--transparent
--keymaps
--boo
--material

function ColorTB(color)
	--color = color  "kanagawa-dragon";
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

--------------------------------------------------
--					KEYMAPS						--
--------------------------------------------------
local k = vim.keymap.set
k('n', '<leader>cmt', ':lua require("material.functions").find_style()<CR>')
k('n', '<leader>cb', ':lua ColorTB ()<CR>')

