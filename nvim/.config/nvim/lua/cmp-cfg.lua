local luasnip = require 'luasnip'
local nvim_lsp = require 'lspconfig'

-- nvimcmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  -- mapping = {
  --   ['<C-p>'] = cmp.mapping.prev_item(),
  --   ['<C-n>'] = cmp.mapping.next_item(),
  --   ['<C-d>'] = cmp.mapping.scroll(-4),
  --   ['<C-f>'] = cmp.mapping.scroll(4),
  --   ['<C-Space>'] = cmp.mapping.complete(),
  --   ['<C-e>'] = cmp.mapping.close(),
  --   ['<CR>'] = cmp.mapping.confirm {
  --     behavior = cmp.ConfirmBehavior.Replace,
  --     select = true,
  --   },
  --   ['<Tab>'] = cmp.mapping.mode({ 'i', 's' }, function(_, fallback)
  --     if vim.fn.pumvisible() == 1 then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
  --     elseif luasnip.expand_or_jumpable() then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
  --     else
  --       fallback()
  --     end
  --   end),
  --   ['<S-Tab>'] = cmp.mapping.mode({ 'i', 's' }, function(_, fallback)
  --     if vim.fn.pumvisible() == 1 then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
  --     elseif luasnip.jumpable(-1) then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
  --     else
  --       fallback()
  --     end
  --   end),
  -- },
  
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
  },
}
