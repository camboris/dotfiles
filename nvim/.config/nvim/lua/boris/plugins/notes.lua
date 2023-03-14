local neorg = {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.completion"] = {
          config = {
            engine = "nvim-cmp"
          }
        },
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              prueba = "~/desarrollo/pruebas/norg/",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  }
}

local mind = {
  'phaazon/mind.nvim',
  branch = 'v2.2',
  cmd = {
    "MindOpenMain",
    "MindOpenProject",
    "MindOpenSmartProject",
  },
  keys = {
    { '<leader>mm', '<cmd>MindOpenMain<CR>',         desc = "Opens Mind Main Project" },
    { '<leader>mp', '<cmd>MindOpenProject<CR>',      desc = "Opens Mind Local Project" },
    { '<leader>ms', '<cmd>MindOpenSmartProject<CR>', desc = "Opens Mind Smart Project" },
    { '<leader>mc', '<cmd>MindClose<CR>',            desc = "Closes Mind Project" }
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require 'mind'.setup({
      edit = {
        data_extension = ".norg",
        data_header = "* %s",
      },
      keymaps = {
        normal = {
          ["<leader>mf"] = "open_data_index"
        }
      },
    })
  end
}

return {
  mind,
  neorg
}
