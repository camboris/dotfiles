local plantuml = {
  "aklt/plantuml-syntax",
  ft="plantuml"
}

local blink = {
  'saghen/blink.cmp',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = false } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require 'nvim-treesitter'.install { "lua", "vim", "help", "markdown", "html", "javascript", "json", "python", "regex", "tsx",
      "typescript", "css", "diff", "dockerfile", "dot", "go", "http", "bash", "markdown_inline" }
  end
}

local autopairs = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup {
      check_ts = true,
      fast_wrap = {},
    }
  end
}
local dropbar = {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    config = function()
      local dropbar_api = require('dropbar.api')
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end
  }
return {
  autopairs,
  blink,
  dropbar,
  plantuml,
  treesitter,
}
