local g = vim.g
local cmd = vim.cmd

-- Available values: `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'`
-- g.sonokai_style = 'shusia'
-- cmd 'colorscheme sonokai'
--
local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
  {
    colorscheme = "dark_catppuccino",
    transparency = false,
    styles = {
      comments = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "NONE",
      variables = "NONE",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        styles = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic"
        }
      },
      lsp_trouble = false,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = false,
      which_key = true,
      indent_blankline = false,
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = false,
      markdown = false,
    }
  }
)

-- load it
catppuccino.load()
