local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ["<C-K>"] = cmp.mapping.select_prev_item(),
    ["<C-J>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
     ["<Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_next_item()
       elseif luasnip.expandable() then
         luasnip.expand()
       elseif luasnip.expand_or_jumpable() then
         luasnip.expand_or_jump()
       elseif check_backspace() then
         fallback()
       else
         fallback()
       end
     end, {
       "i",
       "s",
     }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = {
      side_padding = 1,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
      scrollbar = false,
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "Normal:CmpDoc",
    },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}


------------------------------------------------------------------------------------------------------

--local cmp = require "cmp"
--
--dofile(vim.g.base46_cache .. "cmp")
--
--local cmp_ui = require("core.utils").load_config().ui.cmp
--local cmp_style = cmp_ui.style
--
--local field_arrangement = {
--  atom = { "kind", "abbr", "menu" },
--  atom_colored = { "kind", "abbr", "menu" },
--}
--
--local formatting_style = {
--  -- default fields order i.e completion word + item.kind + item.kind icons
--  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },
--
--  format = function(_, item)
--    local icons = require("nvchad_ui.icons").lspkind
--    local icon = (cmp_ui.icons and icons[item.kind]) or ""
--
--    if cmp_style == "atom" or cmp_style == "atom_colored" then
--      icon = " " .. icon .. " "
--      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
--      item.kind = icon
--    else
--      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
--      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
--    end
--
--    return item
--  end,
--}
--
--local function border(hl_name)
--  return {
--    { "╭", hl_name },
--    { "─", hl_name },
--    { "╮", hl_name },
--    { "│", hl_name },
--    { "╯", hl_name },
--    { "─", hl_name },
--    { "╰", hl_name },
--    { "│", hl_name },
--  }
--end
--
--local options = {
--  completion = {
--    completeopt = "menu,menuone",
--  },
--
--  window = {
--    completion = {
--      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
--      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
--      scrollbar = false,
--    },
--    documentation = {
--      border = border "CmpDocBorder",
--      winhighlight = "Normal:CmpDoc",
--    },
--  },
--  snippet = {
--    expand = function(args)
--      require("luasnip").lsp_expand(args.body)
--    end,
--  },
--
--  formatting = formatting_style,
--
--  mapping = {
--    ["<C-p>"] = cmp.mapping.select_prev_item(),
--    ["<C-n>"] = cmp.mapping.select_next_item(),
--    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--    ["<C-f>"] = cmp.mapping.scroll_docs(4),
--    ["<C-Space>"] = cmp.mapping.complete(),
--    ["<C-e>"] = cmp.mapping.close(),
--    ["<CR>"] = cmp.mapping.confirm {
--      behavior = cmp.ConfirmBehavior.Replace,
--      select = false,
--    },
--    ["<Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif require("luasnip").expand_or_jumpable() then
--        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
--      else
--        fallback()
--      end
--    end, {
--      "i",
--      "s",
--    }),
--    ["<S-Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif require("luasnip").jumpable(-1) then
--        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
--      else
--        fallback()
--      end
--    end, {
--      "i",
--      "s",
--    }),
--  },
--  sources = {
--    { name = "nvim_lsp" },
--    { name = "luasnip" },
--    { name = "buffer" },
--    { name = "nvim_lua" },
--    { name = "path" },
--  },
--}
--
--if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
--  options.window.completion.border = border "CmpBorder"
--end
--
--return options
