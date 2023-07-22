
--------------------------------------------------
--					EVERFOREST					--
--------------------------------------------------
vim.api.nvim_command('colorscheme everforest')

require("everforest").setup({
  ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
  ---Default is "medium".
  background = "medium",
  ---How much of the background should be transparent. 2 will have more UI
  ---components be transparent (e.g. status line background)
  transparent_background_level = 2,
  ---By default, the colour of the sign column background is the same as normal text
  ---background, but you can use a grey background by setting this to `"grey"`.
  sign_column_background = "none",
  ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
  ---`"low"` (default).
  ui_contrast = "low",
  ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
  dim_inactive_windows = true,
  ---Some plugins support highlighting error/warning/info/hint lines, but this
  ---feature is disabled by default in this colour scheme.
  diagnostic_line_highlight = false,
  ---By default, this color scheme won't colour the foreground of |spell|, instead
  ---colored under curls will be used. If you also want to colour the foreground,
  ---set this option to `true`.
  spell_foreground = true,
})

ColorTB("everforest")
