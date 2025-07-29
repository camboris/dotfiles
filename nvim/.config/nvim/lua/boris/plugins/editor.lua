local kanagawa = {
 "rebelot/kanagawa.nvim",
  config = function()
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

local oil = {
  'stevearc/oil.nvim',
  cmd = { "Oil" },
  config = function()
    local detail = false
    require('oil').setup({
      default_file_explorer = true,
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
  end,
  keys = {
    { "-",    "<CMD>Oil --float --preview<CR>", desc = "Open parent directory" },
    { "<F3>", "<CMD>Oil --float --preview<CR>", desc = "Open parent directory" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

return {
  kanagawa,
  oil,
}
