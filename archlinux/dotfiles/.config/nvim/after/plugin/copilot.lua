vim.keymap.set('i', '<Right>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<Left>', '<Plug>(copilot-dismiss)')
vim.keymap.set('i', '<Down>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<Up>', '<Plug>(copilot-previous)')

vim.keymap.set('i', '<Tab>', '<Plug>(copilot-accept-word)')


