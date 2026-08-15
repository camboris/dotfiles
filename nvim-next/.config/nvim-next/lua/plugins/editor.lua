local snacks = {
  src = "gh:folke/snacks.nvim",
  setup = function()
    local Snacks = require("snacks")

    Snacks.setup({
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          -- { section = "startup" },
        }
      },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      words = { enabled = true },
    })

    vim.keymap.set('n', "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })

  end,
}


local oil = {
  src = 'gh:stevearc/oil.nvim',
  setup = function()
    local detail = false
    require('oil').setup({
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    })

    vim.keymap.set('n', "-", "<CMD>Oil --float --preview<CR>", { desc = "Open parent directory" })
    vim.keymap.set('n', "<F3>", "<CMD>Oil --float --preview<CR>", { desc = "Open parent directory" })
  end
}
local which_key = {
  src = "gh:folke/which-key.nvim",
  setup = function()
    require("which-key").setup({
      preset = "modern"
    })

    vim.keymap.set('n', "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      { desc = "Buffer Local Keymaps (which-key)" }
    )
  end
}

local live_server = {
  -- dependencia de markdown_preview
  src = "gh:selimacerbas/live-server.nvim"
}

local markdown_preview = {
  src = "gh:selimacerbas/markdown-preview.nvim",
  setup = function()
    require("markdown_preview").setup({
      -- all optional; sane defaults shown
      instance_mode = "takeover", -- "takeover" (one tab) or "multi" (tab per instance)
      port = 0,                   -- 0 = auto (8421 for takeover, OS-assigned for multi)
      open_browser = true,
      debounce_ms = 300,
    })
    vim.keymap.set("n", "<leader>mps", "<cmd>MarkdownPreview<cr>", { desc = "Markdown: Start preview" })
    vim.keymap.set("n", "<leader>mpS", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown: Stop preview" })
    vim.keymap.set("n", "<leader>mpr", "<cmd>MarkdownPreviewRefresh<cr>", { desc = "Markdown: Refresh preview" })
  end
}

local markview = {
  src = "https://github.com/OXY2DEV/markview.nvim"
}

return {
  oil,
  which_key,
  live_server,
  markdown_preview,
  markview,
  snacks,
}
