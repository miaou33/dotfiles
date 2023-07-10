-- Désactiver le pliage de l'en-tête
vim.g.vim_markdown_folding_disabled = 1

-- Ne pas utiliser la fonctionnalité de masquage (conceal), l'implémentation n'est pas très bonne
vim.g.vim_markdown_conceal = 0

-- Désactiver la fonctionnalité de masquage pour les mathématiques TeX
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1

-- Prise en charge de l'en-tête (front matter) dans différents formats
vim.g.vim_markdown_frontmatter = 1  -- pour le format YAML
vim.g.vim_markdown_toml_frontmatter = 1  -- pour le format TOML
vim.g.vim_markdown_json_frontmatter = 1  -- pour le format JSON

