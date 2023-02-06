local leap = {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      local leap = require("leap")
      leap.add_default_mappings(true)
    end
}

local indent =  { "lukas-reineke/indent-blankline.nvim" }

local zenmode = {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require("zen-mode").setup()
  end
}

return {
  indent,
  leap,
  zenmode,
}
