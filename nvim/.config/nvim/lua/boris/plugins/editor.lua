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

local colorscheme = {
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup({
      filter = "pro",
      background_clear = {
        "toggleterm",
        "telescope",
        "which-key",
        "nvim-tree"
      }
    })
    vim.cmd([[colorscheme monokai-pro]])
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
  surround,
  textobjs,
  tint,
  zenmode,
}
