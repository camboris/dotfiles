local oil = {
  'stevearc/oil.nvim',
  opts = {},
  cmd = { "Oil" },
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

local zenmode = {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require("zen-mode").setup()
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
  event = "BufReadPre",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
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

return {
  colorizer,
  indent,
  leap,
  markdown_preview,
  oil,
  surround,
  textobjs,
  tint,
  zenmode,
  kanagawa,
}
