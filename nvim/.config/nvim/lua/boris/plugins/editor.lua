local oil = {
  'stevearc/oil.nvim',
  opts = {},
  cmd = {"Oil"},
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

local colorscheme = {
  -- 'tiagovla/tokyodark.nvim',
  -- 'marko-cerovac/material.nvim',
  'sainnhe/sonokai',
  config = function()
    vim.g.sonokai_style = 'default'
    -- vim.g.sonokai_style = 'atlantis'
    -- vim.g.sonokai_style = 'andromeda'
    -- vim.g.sonokai_style = 'shusia'
    -- vim.g.sonokai_style = 'maia'
    -- vim.g.sonokai_style = 'espresso'
    vim.g.sonokai_better_performance = 1
    vim.cmd([[colorscheme sonokai]])
  end
}
-- local colorscheme = {
--   "EdenEast/nightfox.nvim",
--   config = function()
--     vim.cmd([[colorscheme duskfox]])
--   end
-- }

local leap = {
  "ggandor/leap.nvim",
  event = "VeryLazy",
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
  colorscheme,
  indent,
  leap,
  markdown_preview,
  oil,
  surround,
  textobjs,
  tint,
  zenmode,
}
