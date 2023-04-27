vim.cmd.colorscheme "boo"

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

vim.keymap.set('n', '<leader>cn', ':colo nordic<CR>')
vim.keymap.set('n', '<leader>cb', ':colo boo<CR>')
