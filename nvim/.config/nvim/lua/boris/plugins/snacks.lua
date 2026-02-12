local snacks = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
        {
          section = "terminal",
          cmd = "pokemon-colorscripts -r --no-title; sleep .1",
          random = 10,
          pane = 2,
          indent = 4,
          height = 30,
        },
      }
    },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end,                                    desc = "Lazygit" },
    { "<leader>un", function() Snacks.notifier.hide() end,                              desc = "Dismiss All Notifications" },
    -- { "<leader>n",  function() Snacks.notifier.show_history() end,                      desc = "Notification History" },
    { "<c-/>",      function() Snacks.terminal() end,                                   desc = "Toggle Terminal" },
    { "<F1>",       function() Snacks.terminal(nil, { win = { position = "float" } }) end, desc = "Toggle Terminal" },
    { "<c-_>",      function() Snacks.terminal() end,                                   desc = "which_key_ignore" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,                     desc = "Next Reference",           mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                    desc = "Prev Reference",           mode = { "n", "t" } },
  }
}

return {
  snacks,
}
