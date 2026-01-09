local decisive = {
  "emmanueltouzery/decisive.nvim",
  ft = "csv",
  config = function()
    require('decisive').setup {}
  end,
  keys = {
    { "<leader>cca", ":lua require('decisive').align_csv({})<cr>",        desc = "align CSV" },
    { "<leader>ccA", ":lua require('decisive').align_csv_clear({})<cr>",  desc = "align CSV clear" },
    { "[c",          ":lua require('decisive').align_csv_prev_col()<cr>", desc = "align CSV prev col" },
    { "]c",          ":lua require('decisive').align_csv_next_col()<cr>", desc = "align CSV next col" },
  }
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  config = function()
    require('kanagawa').setup({
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      }
    })
    vim.cmd([[colorscheme kanagawa-wave ]])
  end
}

local oil = {
  'stevearc/oil.nvim',
  cmd = { "Oil" },
  config = function()
    local detail = false
    require('oil').setup({
      default_file_explorer = true,
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    })
  end,
  keys = {
    { "-",    "<CMD>Oil --float --preview<CR>", desc = "Open parent directory" },
    { "<F3>", "<CMD>Oil --float --preview<CR>", desc = "Open parent directory" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

local which = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

local lualine = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require('lualine').setup({})
  end
}

local bufferline = {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      diagnostics = "nvim_lsp",
    }
  }
}

return {
  bufferline,
  decisive,
  kanagawa,
  lualine,
  oil,
  which,
}
