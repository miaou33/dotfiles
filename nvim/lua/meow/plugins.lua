--------------------------------------------------
--					  CONFIG					--
--------------------------------------------------
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path, })
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

local packer = require("packer")

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
use 'nvim-lua/plenary.nvim'
use 'nvim-tree/nvim-web-devicons'
use 'MunifTanjim/nui.nvim'

--------------------------------------------------
--					FILES						--
--------------------------------------------------
-- TREE DISPLAYER
use { "nvim-neo-tree/neo-tree.nvim" }

-- FILE FINDER
use { 'nvim-telescope/telescope.nvim' }

-- QUICK NAVIGATION
use ('ThePrimeagen/harpoon')

--------------------------------------------------
--					  GIT						--
--------------------------------------------------
use ('tpope/vim-fugitive')
use { 'lewis6991/gitsigns.nvim' }
--use ('github/copilot.vim')

--------------------------------------------------
--					SESSION						--
--------------------------------------------------
-- DASHBOARD
--use { 'goolord/alpha-nvim', }

---- PREVIOUS SESSION
--use { 'rmagatti/auto-session', }
--use { "folke/persistence.nvim", }

-- UNDOTREE
use ('mbbill/undotree')

-- STATUS LINE
use { 'nvim-lualine/lualine.nvim' }

-- SPEED UP
use 'lewis6991/impatient.nvim'


--------------------------------------------------
--				   CODE							--
--------------------------------------------------
-- HIGHLIGHT
use ('nvim-treesitter/nvim-treesitter')
use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
use ('nvim-treesitter/playground')

-- LSP
use { "neovim/nvim-lspconfig"}
use { "williamboman/mason.nvim"}
use { "williamboman/mason-lspconfig.nvim"}
use { "jose-elias-alvarez/null-ls.nvim" }

---- AUTOCOMPLETION
use {'hrsh7th/cmp-nvim-lsp'}
use {'hrsh7th/nvim-cmp'}
use {'hrsh7th/cmp-buffer'}
use {'hrsh7th/cmp-path'}

-- SNIPPETS
use {'rafamadriz/friendly-snippets'}
use {'L3MON4D3/LuaSnip'}

-- LANGUAGES -------------------------------------

-- GO
use 'fatih/vim-go'

-- LUA
use {'saadparwaiz1/cmp_luasnip'}
use {'hrsh7th/cmp-nvim-lua'}

-- MARKDOWN
use 'godlygeek/tabular'
use 'elzr/vim-json'
use 'plasticboy/vim-markdown'
use 'vim-pandoc/vim-pandoc-syntax'

--------------------------------------------------
--					AESTHETICS					--
--------------------------------------------------
---- POPUP 
--use { 'gelguy/wilder.nvim' }

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
use {'olivercederborg/poimandres.nvim'}
use {'rockerBOO/boo-colorscheme-nvim'}
use {"lunarvim/Onedarker.nvim"}
use {'gbprod/nord.nvim'}
use { "neanias/everforest-nvim"}
use {"lunarvim/templeos.nvim"}
use {'voidekh/kyotonight.vim'}
use {'kdheepak/monochrome.nvim'}
use {'marko-cerovac/material.nvim'}
use {'Soares/base16.nvim'}

end)
