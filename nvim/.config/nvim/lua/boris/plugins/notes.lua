local neorg = {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    cmd = { "Neorg" },
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
        ["core.integrations.nvim-cmp"] = {},
        ["core.concealer"] = { config = { icon_preset = "varied" } },
        ["core.export"] = {},
        -- ["core.keybinds"] = {
        --   -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
        --   config = {
        --     default_keybinds = true,
        --     neorg_leader = "<Leader><Leader>",
        --   },
        -- },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              prueba = "~/desarrollo/pruebas/norg/",
              swat = "~/desarrollo/swat/",
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
  -- mind,
  neorg
}
