
--------------------------------------------------
--					 KEYMAPS					--
--------------------------------------------------
local k = vim.keymap.set
k('n', '<leader>gs', vim.cmd.Git)
k('n', '<space>gp', ':Git push<CR>')

--cc                      Create a commit.
--ca                      Amend the last commit and edit the message.
--ce                      Amend the last commit without editing the message.
--cw                      Reword the last commit.
