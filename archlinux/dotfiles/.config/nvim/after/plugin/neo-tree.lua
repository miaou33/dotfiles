require("neo-tree").setup({
  filesystem = {
    window = {
      mappings = {
        ["<CR>"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["R"] = "refresh",
      },
	  filtered_items = {
		  visible = true, -- when true, they will just be displayed differently than normal items
		  hide_dotfiles = false,
	  },
    bind_to_cwd = true,
    before_render = function(_)
      return
    end,
	show_hidden = true,
    },
  },
})

--------------------------------------------------
--					KEYMAPS						--
--------------------------------------------------
local k = vim.keymap.set
-- neotree 
k('n', '<leader>e', vim.cmd.Neotree)
