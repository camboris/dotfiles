local tiny_cmd = {
  src = "gh:rachartier/tiny-cmdline.nvim",
  setup = function()
    require("tiny-cmdline").setup({
      -- Cmdline types rendered at the bottom of the screen instead of centered
      -- "/" and "?" (search) are kept native by default
      -- native_types = { "/", "?" },
      native_types = {},
    })
  end
}

local icons = {
  -- icons
  src = "gh:nvim-tree/nvim-web-devicons"
}

local kanagawa = {
  -- colorscheme
  src = "gh:rebelot/kanagawa.nvim",
  setup = function()
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
local lualine = {
  src = 'gh:nvim-lualine/lualine.nvim',
  setup = function()
    require('lualine').setup({
    })
  end
}

local bufferline = {
  src = 'gh:akinsho/bufferline.nvim',
  setup = function()
    require('bufferline').setup({
      options = {
        diagnostics = "nvim_lsp",
      }
    })
  end
}

return {
  kanagawa,
  icons,
  tiny_cmd,
  bufferline,
  lualine,
}
