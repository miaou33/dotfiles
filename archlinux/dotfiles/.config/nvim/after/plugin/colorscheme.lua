--------------------------------------------------
--				INDEX & DEFINES					--
--------------------------------------------------
--transparent
--keymaps
--boo
--material

function ColorTB(color)
	--color = color  "kanagawa-dragon";
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

--------------------------------------------------
--					KEYMAPS						--
--------------------------------------------------
local k = vim.keymap.set
k('n', '<leader>cmt', ':lua require("material.functions").find_style()<CR>')
k('n', '<leader>cb', ':lua ColorTB ()<CR>')

--------------------------------------------------
--					  BOO						--
--------------------------------------------------
--local boo_colorscheme_status_ok, boo_colorscheme = pcall(require, "boo-colorscheme")
--if not boo_colorscheme_status_ok then
--  return
--end
--
--boo_colorscheme.use({
	--  italic = true, -- toggle italics
	--  no_background = true,
	--  theme = "boo"
	--})
	--
--vim.cmd("colorscheme boo")
--ColorTB("boo")

--------------------------------------------------
--					KANAGAWA					--
--------------------------------------------------
local kanagawa_status_ok, kanagawa = pcall(require, "kanagawa")
if not kanagawa_status_ok then
  return
end

kanagawa.setup({
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-dragon")
ColorTB("kanagawa-dragon")

--------------------------------------------------
--					MATERIAL					--
--------------------------------------------------

--local material_status_ok, material = pcall(require, "material")
--if not material_status_ok then
--  return
--end
--
--material.setup({
--
--    styles = { -- Give comments style such as bold, italic, underline etc.
--        comments = { --[[ italic = true ]] },
--        strings = { --[[ bold = true ]] },
--        keywords = { --[[ underline = true ]] },
--        functions = { --[[ bold = true, undercurl = true ]] },
--        variables = {},
--        operators = {},
--        types = {},
--    },
--
--    plugins = { -- Available plugins: "dap", "dashboard", "gitsigns", "hop", "indent-blankline", "lspsaga", "mini", "neogit", "neorg", "nvim-cmp", "nvim-navic", "nvim-tree", "nvim-web-devicons", "sneak", "telescope", "trouble", "which-key",
--		"indent-blankline",
--    },
--
--    disable = {
--        colored_cursor = false, -- Disable the colored cursor
--        borders = false, -- Disable borders between verticaly split windows
--        --background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--        background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--        term_colors = false, -- Prevent the theme from setting terminal colors
--        eob_lines = false -- Hide the end-of-buffer lines
--    },
--    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
--    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
--    custom_colors = nil, -- If you want to everride the default colors, set this to a function
--    custom_highlights = {}, -- Overwrite highlights with your own
--})
--
--vim.cmd.colorscheme "material"
--vim.g.material_style = "oceanic"
--ColorTB("material")

