
-- Compe setup
require('compe').setup {
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  source = {
    path = true,
    nvim_lsp = true,
    luasnip = true,
    buffer = false,
    calc = false,
    nvim_lua = false,
    vsnip = false,
    ultisnips = false,
  },
}
