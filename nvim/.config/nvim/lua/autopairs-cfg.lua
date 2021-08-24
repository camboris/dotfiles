require('nvim-autopairs').setup{
  ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
  check_ts = true,
  fast_wrap = {},
}

-- require("nvim-autopairs.completion.compe").setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true -- it will auto insert `(` after select function or method item
-- })
