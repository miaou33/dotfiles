local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 150,
        })
    end,
})

vim.api.nvim_command('autocmd VimEnter * PackerSync')
vim.api.nvim_command('autocmd VimEnter * MasonUpdate')
vim.api.nvim_command('autocmd VimEnter * TSUpdate')


