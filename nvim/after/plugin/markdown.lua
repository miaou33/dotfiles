local vimglobal = vim.g
-- Désactiver le pliage de l'en-tête
vimglobal.vim_markdown_folding_disabled = 1

-- Ne pas utiliser la fonctionnalité de masquage (conceal), l'implémentation n'est pas très bonne
vimglobal.vim_markdown_conceal = 0

-- Désactiver la fonctionnalité de masquage pour les mathématiques TeX
vimglobal.tex_conceal = ""
vimglobal.vim_markdown_math = 1

-- Prise en charge de l'en-tête (front matter) dans différents formats
vimglobal.vim_markdown_frontmatter = 1  -- pour le format YAML
vimglobal.vim_markdown_toml_frontmatter = 1  -- pour le format TOML
vimglobal.vim_markdown_json_frontmatter = 1  -- pour le format JSON

