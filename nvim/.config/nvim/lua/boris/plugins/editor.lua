local colorscheme = {
  "EdenEast/nightfox.nvim",
  config = function()
    vim.cmd([[colorscheme duskfox]])
  end
}

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
  surround,
  tint,
  zenmode,
}
