local lspconfig = require("lspconfig")

lspconfig.clangd.setup{
   on_attach = function(client, bufnr)
      -- Optional: Set up your keybindings and other settings here.
   end
}

------------------------------------------
--				BORDERS					--
------------------------------------------

--vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
--vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

--local border = {
--	{"🭽", "FloatBorder"},
--	{"▔", "FloatBorder"},
--	{"🭾", "FloatBorder"},
--	{"▕", "FloatBorder"},
--	{"🭿", "FloatBorder"},
--	{"▁", "FloatBorder"},
--	{"🭼", "FloatBorder"},
--	{"▏", "FloatBorder"},
--}

-- LSP settings (for overriding per client)
local handlers =  {
	["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
	["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

-- Do not forget to use the on_attach function
-- require 'lspconfig'.myserver.setup { handlers=handlers }

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

------------------------------------------
--         COMPLETION KINDS				--
------------------------------------------
--local M = {}
--
--M.icons = {
--	Class = " ",
--	Color = " ",
--	Constant = " ",
--	Constructor = " ",
--	Enum = "了 ",
--	EnumMember = " ",
--	Field = " ",
--	File = " ",
--	Folder = " ",
--	Function = " ",
--	Interface = "ﰮ ",
--	Keyword = " ",
--	Method = "ƒ ",
--	Module = " ",
--	Property = " ",
--	Snippet = "﬌ ",
--	Struct = " ",
--	Text = " ",
--	Unit = " ",
--	Value = " ",
--	Variable = " ",
--}
--
--function M.setup()
--	local kinds = vim.lsp.protocol.CompletionItemKind
--	for i, kind in ipairs(kinds) do
--		kinds[i] = M.icons[kind] or kind
--	end
--end

------------------------------------------
--			DIAGNOSTICS					--
------------------------------------------
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		active = signs, -- show signs
	},
	underline = true,
	update_in_insert = true,
	severity_sort = false,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})


------------------------------------------
--			DIAG ON CURSOR				--
------------------------------------------

vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--			border = 'rounded',
			source = 'always',
			prefix = ' ',
			scope = 'cursor',
		}
		vim.diagnostic.open_float(nil, opts)
	end
})


------------------------------------------
--			DEF IN SPLIT				--
------------------------------------------

local function goto_definition(split_cmd)
	local util = vim.lsp.util
	local log = require("vim.lsp.log")
	local api = vim.api

	-- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
		local handler = function(_, result, ctx)
			if result == nil or vim.tbl_isempty(result) then
				local _ = log.info() and log.info(ctx.method, "No location found")
				return nil
			end

			if split_cmd then
				vim.cmd(split_cmd)
			end

			if vim.tbl_islist(result) then
				util.jump_to_location(result[1])

				if #result > 1 then
					util.set_qflist(util.locations_to_items(result))
					api.nvim_command("copen")
					api.nvim_command("wincmd p")
				end
			else
				util.jump_to_location(result)
			end
		end

		return handler
	end

	vim.lsp.handlers["textDocument/definition"] = goto_definition('split')
	vim.lsp.handlers["textDocument/definition"] = goto_definition('split')



------------------------------------------
--				KEYMAPS					--
------------------------------------------

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
end

return M
