
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'nightfox',
  },
  sections = {
    lualine_a = { "mode", "paste" },
    lualine_b = {
      { "branch", icon = "" },
      { "diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666" },
    },
    lualine_c = {
      { "diagnostics", sources = { "nvim_diagnostic" } },
      "filename",
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {
      {
        "progress",
      },
    },
    lualine_z = {
      {
        "location",
        icon = "",
      },
    },
  },
  tabline = {
  },
  extensions = { "nvim-tree", "toggleterm" },
})

