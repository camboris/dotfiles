local mini = {
  'echasnovski/mini.nvim',
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.animate').setup({
      scroll = {
        enable = false,
      }
    })
    require('mini.splitjoin').setup()
    require('mini.sessions').setup({})
    vim.api.nvim_set_keymap(
      "n",
      "<leader>qw",
      [[<cmd>lua MiniSessions.write(require("functions").sessionInput())<cr>]],
      { desc = "Sessions: write session" }
    )
    vim.api.nvim_set_keymap("n", "<leader>qr", [[<cmd>lua MiniSessions.read(require("functions").sessionInput())<cr>]],
      { desc = "Sessions: read a session by name" })
    vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua MiniSessions.select()<cr>]],
      { desc = "Sessions: Select a session" })
    vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua MiniSessions.read(MiniSessions.get_latest())<cr>]],
      { desc = "Sessions: Load last session" })
  end
}

return mini
