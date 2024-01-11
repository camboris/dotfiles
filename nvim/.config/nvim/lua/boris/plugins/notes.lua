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
        -- ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        ["core.keybinds"] = {
          --   -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
          config = {
            --     default_keybinds = true,
            --     neorg_leader = "<Leader><Leader>",
            hook = function(keybinds)
              keybinds.remap_event("norg", "i", "<S-CR>", "core.itero.next-iteration")
            end,
          },
        },
        ["core.summary"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              prueba = "~/desarrollo/pruebas/norg/",
              swat = "~/desarrollo/swat",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  }
}

local obsidian = {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/desarrollo/swat/obsidian/Swat/**.md" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      dir = "~/desarrollo/swat/obsidian/Swat/", -- no need to call 'vim.fn.expand' here
      mappings = {
        -- ["gf"] = require("obsidian.mapping").gf_passthrough(),
      },
    })
    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { noremap = false, expr = true })
    vim.keymap.set("n", "<leader>oo", "<Cmd>ObsidianQuickSwitch<CR>", { desc = "[Obsidian] Quick Search" })
    vim.keymap.set("n", "<leader>oa", "<Cmd>ObsidianOpen<CR>", { desc = "[Obsidian] Open in app" })
    vim.keymap.set("n", "<leader>os", "<Cmd>ObsidianSearch<CR>", { desc = "[Obsidian] Search" })
    vim.keymap.set("n", "<leader>ob", "<Cmd>ObsidianBacklinks<CR>", { desc = "[Obsidian] Backlinks" })
  end
}

return {
  neorg,
  obsidian
}
