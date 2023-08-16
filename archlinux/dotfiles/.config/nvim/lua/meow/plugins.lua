--------------------------------------------------
--					  INDEX						--
--------------------------------------------------
-- CONFIG 
-- FILES
-- GIT
-- SESSION
-- SYNTAX
-- THEMES

--------------------------------------------------
--					  CONFIG					--
--------------------------------------------------
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function(use)

use 'wbthomason/packer.nvim'

--------------------------------------------------
--					FILES						--
--------------------------------------------------
-- TREE DISPLAYER
--use {"nvim-tree/nvim-tree.lua"}
--use {"nvim-tree/nvim-web-devicons"}
--
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", requires = {
	  "nvim-lua/plenary.nvim",
	  "nvim-tree/nvim-web-devicons",
	  "MunifTanjim/nui.nvim", } }

-- FILE FINDER
use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', branch = '0.1.x', requires = {
	{'nvim-lua/plenary.nvim'} } }

-- QUICK NAVIGATION
use ('ThePrimeagen/harpoon')

--------------------------------------------------
--					  GIT						--
--------------------------------------------------
use ('tpope/vim-fugitive')
use {
   'lewis6991/gitsigns.nvim',
   requires = { 'nvim-lua/plenary.nvim' },
   config = function() require'gitsigns'.setup() end
}

--------------------------------------------------
--					SESSION						--
--------------------------------------------------
-- DASHBOARD
--use {
--    'goolord/alpha-nvim',
--    config = function ()
--        require'alpha'.setup(require'alpha.themes.dashboard'.config)
--    end
--}

---- PREVIOUS SESSION
--use {
--  'rmagatti/auto-session',
--  config = function()
--    require("auto-session").setup {
--      log_level = "error",
--      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
--    }
--  end
--}
--use({
--	"folke/persistence.nvim",
--	event = "BufReadPre", -- this will only start session saving when an actual file was opened
--	module = "persistence",
--	config = function()
--		require("persistence").setup()
--	end,
--})

-- UNDOTREE
use ('mbbill/undotree')

-- STATUS LINE
use { 'nvim-lualine/lualine.nvim', requires = {
	'nvim-tree/nvim-web-devicons', opt = true } }

-- SPEED UP
use 'lewis6991/impatient.nvim'


--------------------------------------------------
--				     SYNTAX						--
--------------------------------------------------
-- HIGHLIGHT
use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use ('nvim-treesitter/playground')

-- LSP
use { "neovim/nvim-lspconfig"}
use { "williamboman/mason.nvim"}
use { "williamboman/mason-lspconfig.nvim"}
use { "jose-elias-alvarez/null-ls.nvim"}

-- AUTOCOMPLETION
use {'hrsh7th/nvim-cmp'}
use {'hrsh7th/cmp-buffer'}
use {'hrsh7th/cmp-path'}
use {'saadparwaiz1/cmp_luasnip'}
use {'hrsh7th/cmp-nvim-lsp'}
use {'hrsh7th/cmp-nvim-lua'}

-- Snippets
use {'L3MON4D3/LuaSnip'}
use {'rafamadriz/friendly-snippets'}

-- MARKDOWN
use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
use 'godlygeek/tabular'
use 'elzr/vim-json'
use 'plasticboy/vim-markdown'
use 'vim-pandoc/vim-pandoc-syntax'

--------------------------------------------------
--					AESTHETICS					--
--------------------------------------------------
---- POPUP 
--use {
--  'gelguy/wilder.nvim',
--  config = function()
--    -- config goes here
--  end,
--}

-- BLANKLINES HIGHLIGHT
use "lukas-reineke/indent-blankline.nvim"

--------------------------------------------------
--				 TABS							--
--------------------------------------------------
use 'nanozuki/tabby.nvim'

--------------------------------------------------
--				 THEMES							--
--------------------------------------------------
use {'AlexvZyl/nordic.nvim'}
use {'folke/tokyonight.nvim'}
use {"catppuccin/nvim", as = "catppuccin" }
use {"rebelot/kanagawa.nvim"}
use {'nyoom-engineering/oxocarbon.nvim'}
use {"bluz71/vim-nightfly-colors", as = "nightfly" }
use {"bluz71/vim-moonfly-colors", as = "moonfly" }
use {"EdenEast/nightfox.nvim"}
use {'olivercederborg/poimandres.nvim', config = function() require('poimandres').setup {} end }
use {'rockerBOO/boo-colorscheme-nvim'}
use {"lunarvim/Onedarker.nvim"}
use {'gbprod/nord.nvim'}
use { "neanias/everforest-nvim", config = function() require("everforest").setup() end, }
use {"lunarvim/templeos.nvim"}
use {'voidekh/kyotonight.vim'}
use {'kdheepak/monochrome.nvim', config = function() end}
use 'marko-cerovac/material.nvim'
use 'Soares/base16.nvim'

end)
