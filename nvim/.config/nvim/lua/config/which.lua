require("which-key").setup({
  plugins = {
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
  },
  window = {
    border = "single", -- none, single, double, shadow
  },
})


local wk = require("which-key")
default_options = { silent = true }

wk.register({
  ["<Tab>"] = { "<cmd>e#<cr>", "Switch to previously opened buffer" },
}, { prefix = "<leader>", mode = "n", default_options })
