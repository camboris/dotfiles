local M = {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {
      check_ts = true,
      fast_wrap = {},
    }
  end
}
return M
