-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- NTREE
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    }
}

-- STATUS LINE
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

-- TELESCOPE : FILE NAVIGATOR
-- use {
-- 	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- 	  -- or                            , branch = '0.1.x',
-- 	  requires = { {'nvim-lua/plenary.nvim'} }
-- }

-- SYNTAX HIGHLIGHTING
use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use ('nvim-treesitter/playground')

-- MARK FILES AND NAVIGATE THROUGH THEM
use ('ThePrimeagen/harpoon')

-- UNDO HISTORY VISUALIZER
use ('mbbill/undotree')

-- GIT FACILITIES
use ('tpope/vim-fugitive')

--
use {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{                                      -- Optional
		'williamboman/mason.nvim',
		run = function()
			pcall(vim.cmd, 'MasonUpdate')
		end,
	},
	{'williamboman/mason-lspconfig.nvim'}, -- Optional

	-- Autocompletion
	{'hrsh7th/nvim-cmp'},     -- Required
	{'hrsh7th/cmp-nvim-lsp'}, -- Required
	{'L3MON4D3/LuaSnip'},     -- Required
}
  }


  -- THEMES
  use 'AlexvZyl/nordic.nvim'
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"
  use {'nyoom-engineering/oxocarbon.nvim'}
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use { "bluz71/vim-moonfly-colors", as = "moonfly" }
  use "EdenEast/nightfox.nvim"
  use {
      'olivercederborg/poimandres.nvim',
      config = function()
          require('poimandres').setup {
              -- leave this setup function empty for default config
              -- or refer to the configuration section
              -- for configuration options
          }
      end
  }
  use 'rockerBOO/boo-colorscheme-nvim'
  use "lunarvim/Onedarker.nvim"
  use 'gbprod/nord.nvim'
  use({
      "neanias/everforest-nvim",
      -- Optional; default configuration will be used if setup isn't called.
      config = function()
          require("everforest").setup()
      end,
  })
  use "lunarvim/templeos.nvim"
  use 'voidekh/kyotonight.vim'

end)
