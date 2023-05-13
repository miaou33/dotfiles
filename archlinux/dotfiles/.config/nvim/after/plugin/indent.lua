local indent_status_ok, indent = pcall(require, "indent_blankline")
if not indent_status_ok then
  return
end

vim.opt.list = true

indent.setup {
    show_end_of_line = true,
}
