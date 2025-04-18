local neoclip = {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('neoclip').setup()
  end,
  event = "BufRead",
  keys = {
    { "<leader>fy", "<cmd>Telescope neoclip plus<CR>", desc = "Telescope Yank history" },
  }
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

local markdown_preview = {
  "iamcco/markdown-preview.nvim",
  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
    "MarkdownPreviewToggle"
  },
  ft = "markdown",
  build = "cd app && npm install",
}

local headlines = {
  "lukas-reineke/headlines.nvim",
  ft = "markdown",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true, -- or `opts = {}`
}

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

local textobjs = {
  "chrisgrieser/nvim-various-textobjs",
  event = "BufRead",
  config = function()
    require("various-textobjs").setup({ useDefaultKeymaps = true })
  end,
}

-- local monokaipro = {
--   "loctvl842/monokai-pro.nvim",
--   config = function()
--     require("monokai-pro").setup({
--       filter = "pro",
--       background_clear = {
--         "toggleterm",
--         "telescope",
--         "which-key",
--         "nvim-tree"
--       }
--     })
--     -- vim.cmd([[colorscheme monokai-pro]])
--   end
-- }

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
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- NormalFloat = { bg = "none" },
          -- FloatBorder = { bg = "none" },
          -- FloatTitle = { bg = "none" },
          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          -- PmenuSbar = { bg = theme.ui.bg_m1 },
          -- PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    })
    vim.cmd([[colorscheme kanagawa-wave ]])
  end
}

-- local bamboo = {
--   'ribru17/bamboo.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('bamboo').setup {
--       -- optional configuration here
--     }
--     require('bamboo').load()
--   end,
-- }

-- local colorscheme = {
--   -- 'tiagovla/tokyodark.nvim',
--   -- 'marko-cerovac/material.nvim',
--   'sainnhe/sonokai',
--   config = function()
--     vim.g.sonokai_style = 'default'
--     -- vim.g.sonokai_style = 'atlantis'
--     -- vim.g.sonokai_style = 'andromeda'
--     -- vim.g.sonokai_style = 'shusia'
--     -- vim.g.sonokai_style = 'maia'
--     -- vim.g.sonokai_style = 'espresso'
--     vim.g.sonokai_better_performance = 1
--     -- vim.cmd([[colorscheme sonokai]])
--   end
-- }
-- local colorscheme = {
--   "EdenEast/nightfox.nvim",
--   config = function()
--     vim.cmd([[colorscheme duskfox]])
--   end
-- }

local leap = {
  "ggandor/leap.nvim",
  event = "BufRead",
  config = function()
    local leap = require("leap")
    leap.add_default_mappings(true)
  end
}

local indent = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
}

local hardtime = {
  "m4xshen/hardtime.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim"
  },
  opts = {}
}

local zenmode = {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 1,  -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          signcolumn = "no",      -- disable signcolumn
          number = false,         -- disable number column
          relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false,                -- disables the ruler text in the cmd line area
          showcmd = false,              -- disables the command in the last line of the screen
        },
        twilight = { enabled = true },  -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        -- this will change the font size on wezterm when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        wezterm = {
          enabled = TelescopeResultsBorder,
          -- can be either an absolute font size or the number of incremental steps
          font = "+4", -- (10% increase per step)
        },
      },
    })
  end
}

local colorizer = {
  'NvChad/nvim-colorizer.lua',
  event = "BufReadPre",
  config = function()
    require 'colorizer'.setup({})
  end
}

local surround = {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup()
  end
}

local tint = {
  "levouh/tint.nvim",
  event = "BufReadPre",
  config = function()
    require("tint").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}

local markdown = {
  'MeanderingProgrammer/render-markdown.nvim',
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },   -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  opts = {},
  ft = "markdown",
}

return {
  -- hardtime,
  -- headlines,
  -- textobjs,
  colorizer,
  decisive,
  indent,
  kanagawa,
  leap,
  markdown,
  markdown_preview,
  neoclip,
  oil,
  surround,
  tint,
  zenmode,
}
