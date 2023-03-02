local noice = {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      -- add any options here
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
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
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}

return {
  bufferline,
  lualine,
  noice,
}
