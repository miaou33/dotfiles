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

-- Auto update once a day
-- This script will create a file named last_run in the Neovim data directory (usually ~/.local/share/nvim). 
-- This file will store the date of the last run of the commands. 
-- The run_commands function will check this file and only run the commands if they have not been run on the current date.
-- Please note that this script uses the os.date function to get the current date, and the io.open, io.read, and io.write 
-- functions to read and write the last_run file. These functions are part of the standard Lua library and should be available in your Neovim Lua environment.

function run_commands()
    local last_run_file = vim.fn.stdpath('data') .. '/last_run'
    local last_run = io.open(last_run_file, 'r')
    local current_date = os.date('%Y%m%d')

    if last_run then
        local last_run_date = last_run:read('*l')
        last_run:close()

        if last_run_date == current_date then
            return
        end
    end

    vim.api.nvim_command('PackerSync')
    vim.api.nvim_command('MasonUpdate')
    vim.api.nvim_command('TSUpdate')
    --vim.api.nvim_command('Copilot setup')

    local last_run = io.open(last_run_file, 'w')
    last_run:write(current_date)
    last_run:close()
end

vim.api.nvim_command('autocmd VimEnter * lua run_commands()')





