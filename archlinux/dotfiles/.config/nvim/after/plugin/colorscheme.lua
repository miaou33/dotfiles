--------------------------------------------------
--				INDEX & DEFINES					--
--------------------------------------------------
--transparent
--keymaps
--boo
--material

vim.cmd.colorscheme "material"
vim.g.material_style = "oceanic"

--------------------------------------------------
--					KEYMAPS						--
--------------------------------------------------
local k = vim.keymap.set
k('n', '<leader>cmt', ':lua require("material.functions").find_style()<CR>')
k('n', '<leader>cb', ':lua ColorTB ()<CR>')

--------------------------------------------------
--					  BOO						--
--------------------------------------------------
--require("boo-colorscheme").use({
	--  italic = true, -- toggle italics
	--  no_background = true,
	--  theme = "boo"
	--})
	--

--------------------------------------------------
--					MATERIAL					--
--------------------------------------------------

require('material').setup({

    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { --[[ italic = true ]] },
        strings = { --[[ bold = true ]] },
        keywords = { --[[ underline = true ]] },
        functions = { --[[ bold = true, undercurl = true ]] },
        variables = {},
        operators = {},
        types = {},
    },

    plugins = { -- Available plugins: "dap", "dashboard", "gitsigns", "hop", "indent-blankline", "lspsaga", "mini", "neogit", "neorg", "nvim-cmp", "nvim-navic", "nvim-tree", "nvim-web-devicons", "sneak", "telescope", "trouble", "which-key",
		--"indent-blankline",
    },

    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

    custom_colors = nil, -- If you want to everride the default colors, set this to a function

    custom_highlights = {}, -- Overwrite highlights with your own
})

--------------------------------------------------
--				  TRANSPARENT					--
--------------------------------------------------

function ColorTB(color)
	color = color or "material";
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorTB()

