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


--------------------------------------------------
--					  PLUGINS					--
--------------------------------------------------
-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- NTREE
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", requires = {
	  "nvim-lua/plenary.nvim",
	  "nvim-tree/nvim-web-devicons",
	  "MunifTanjim/nui.nvim", } }

-- STATUS LINE
use { 'nvim-lualine/lualine.nvim', requires = {
	  'nvim-tree/nvim-web-devicons', opt = true } }

-- TELESCOPE : FILE NAVIGATOR
use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }

-- SYNTAX HIGHLIGHTING
use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use ('nvim-treesitter/playground')

-- MARK FILES AND NAVIGATE THROUGH THEM
use ('ThePrimeagen/harpoon')

-- UNDO HISTORY VISUALIZER
use ('mbbill/undotree')

-- GIT FACILITIES
use ('tpope/vim-fugitive')

-- AUTOCOMPLETION

use { "hrsh7th/nvim-cmp"} -- The completion plugin
use { "hrsh7th/cmp-buffer"} -- buffer completions
use { "hrsh7th/cmp-path"} -- path completions
use { "saadparwaiz1/cmp_luasnip"} -- snippet completions
use { "hrsh7th/cmp-nvim-lsp"}
use { "hrsh7th/cmp-nvim-lua"}

use { "L3MON4D3/LuaSnip"} --snippet engine
use { "rafamadriz/friendly-snippets"} -- a bunch of snippets to use

-- use { 'VonHeikemen/lsp-zero.nvim', branch = 'v2.x', requires = {
-- 		-- LSP Support
-- 		{'neovim/nvim-lspconfig'},             -- Required
-- 		{ 'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end, },
-- 		{'williamboman/mason-lspconfig.nvim'}, -- Optional
-- 
-- 		-- Autocompletion
-- 		{'hrsh7th/nvim-cmp'},
-- 		{'hrsh7th/cmp-nvim-lsp'},
-- 		{'L3MON4D3/LuaSnip'},} }

 -- THEMES
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

end)
