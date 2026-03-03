local render_markdow = {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { "markdown", "md", "AgenticChat" },
    completions = {
      lsp = {
        enabled = true
      }
    },
  },
  ft = "markdown",
}

local markview = {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- For blink.cmp's completion
  -- source
  dependencies = {
    "saghen/blink.cmp"
  },
}

local markdown_preview = {
  "iamcco/markdown-preview.nvim",
  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
    "MarkdownPreviewToggle"
  },
  ft = "markdown",
  build = "cd app && npm install",
}

local markdown = {
  "tadmccorkle/markdown.nvim",
  ft = "markdown", -- or 'event = "VeryLazy"'
  opts = {
    -- configuration here or empty for defaults
  },
}

return {
  render_markdow,
  markdown,
  -- markview,
  markdown_preview,
}
