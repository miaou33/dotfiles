--------------------------------------------------
--				COLORSCHEME						--
--------------------------------------------------
vim.cmd.colorscheme "boo"

--------------------------------------------------
--				TRANSPARENT						--
--------------------------------------------------
require("boo-colorscheme").use({
  italic = true, -- toggle italics
  no_background = true,
  theme = "boo"
})

function ColorTB(color)
	color = color or "boo";
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorTB()

--------------------------------------------------
--					KEYMAPS						--
--------------------------------------------------
local k = vim.keymap.set
k('n', '<leader>cmt', ':lua require("material.functions").find_style()<CR>')
k('n', '<leader>cb', ':lua ColorTB ()<CR>')
k('n', '<leader>tb', ':lua ColorTB ()<left>')

