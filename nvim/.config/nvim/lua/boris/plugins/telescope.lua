local telescope = {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    event = "VeryLazy",
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          layout_strategy = "flex",
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
          },
        },
      })
      require('telescope').load_extension('fzf')
      require("telescope").load_extension("ui-select")
    end,
    keys = {
      { "<leader>ff",       "<cmd>Telescope find_files<cr>",                                     desc = "Telescope find files" },
      { "<leader>fr",       "<cmd>Telescope resume<cr>",                                         desc = "Telescope resume last search" },
      { "<leader>fc",       "<cmd>Telescope commands<cr>",                                       desc = "Telescope commands" },
      { "<leader>fb",       "<cmd>Telescope current_buffer_fuzzy_find<cr>",                      desc = "Telescope Buffer Fuzzy" },
      { "<leader>fh",       "<cmd>Telescope help_tags<cr>",                                      desc = "Telescope Help Tags" },
      { "<leader>fd",       "<cmd>Telescope grep_string<cr>",                                    desc = "Telescope Grep String" },
      { "<leader>fp",       "<cmd>Telescope live_grep<cr>",                                      desc = "Telescope Live Grep" },
      { "<leader>fo",       "<cmd>Telescope oldfiles<cr>",                                       desc = "Telescope Oldfiles" },
      { "<leader>fs",       "<cmd>Telescope spell_suggest<cr>",                                  desc = "Telescope Spell suggest" },
      { "<leader>f<space>", "<cmd>Telescope buffers<cr>",                                        desc = "Telescope Buffers" },
    },
    cmd = "Telescope",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  }
}
return {
  telescope,
}
