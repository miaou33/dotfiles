-- function ColorTB(color)
-- 	color = color or "shine";
-- 	vim.cmd.colorscheme(color)
-- 
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
-- 
-- ColorTB()

vim.keymap.set('n', '<leader>cn', ':colo nordic<CR>')
