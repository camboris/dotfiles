local toggleterm = {
  'akinsho/toggleterm.nvim',
  version = "*",
  cmd = { "ToggleTerm" },
  opts = {
    open_mapping = [[<F1>]],
    direction = "float", -- 'vertical' | 'horizontal' | 'window' | 'float',
  },
  keys = {
    { '<F1>',       '<cmd>ToggleTerm<CR>', desc = "Opens Terminal" },
    { "<leader>gt", '<cmd>lua require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", direction = "float", hidden=true }):toggle()<CR>', desc = "Opens Lazygit terminal" },
    { "<leader>lg", '<cmd>lua require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", direction = "float", hidden=true }):toggle()<CR>', desc = "Opens Lazygit terminal" },
  },
  config = true
}

return toggleterm
