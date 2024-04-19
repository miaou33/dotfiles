local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
	ui = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		--border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

mason_lspconfig.setup({
	ensure_installed = {"gopls"},
	automatic_installation = true,
})

--general setter for every language server
mason_lspconfig.setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
--	["clangd"] = function ()
--		require("clangd").setup {}
--	end
}

