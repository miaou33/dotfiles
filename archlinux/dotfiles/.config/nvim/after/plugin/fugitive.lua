
--------------------------------------------------
--					 KEYMAPS					--
--------------------------------------------------
local k = vim.keymap.set
k('n', '<leader>gs', vim.cmd.Git)
k('n', '<space>gp', ':Git push<CR>')

--=		Toggle an inline diff of the file under the cursor.

--s		Stage (add) the file or hunk under the cursor.
--u		Unstage (reset) the file or hunk under the cursor.
--U		Unstage everything.

--cc	Create a commit.
--ca	Amend the last commit and edit the message.
--ce	Amend the last commit without editing the message.
--cw	Reword the last commit.
--crc	Revert the commit under the cursor.

--ri	Perform an interactive rebase.
--		>Uses ancestor of commit under cursor as upstream if available.

