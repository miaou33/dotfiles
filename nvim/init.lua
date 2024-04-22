--------------------------------------------------
--				KEYMAPS & OPTIONS				--
--------------------------------------------------

if vim.env.WAYLAND_DISPLAY ~= nil then
	vim.g.clipboard = {
		name = 'wl-clipboard',
		copy = {
			['+'] = 'wl-copy',
			['*'] = 'wl-copy',
		},
		paste = {
			['+'] = 'wl-paste',
			['*'] = 'wl-paste',
		},
		cache_enabled = 0,
	}
end

require ("meow.autocmds")
require ("meow.keymaps")
require ("meow.options")
require ("meow.plugins")

