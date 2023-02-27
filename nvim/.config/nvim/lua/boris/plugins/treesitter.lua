local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "mrjones2014/nvim-ts-rainbow"
  },
  config = function()

    local ts = require("nvim-treesitter.configs")

    ts.setup({
      ensure_installed = {
        "lua", "vim", "help", "markdown", "html", "javascript", "json", "python", "regex", "tsx",
        "typescript", "css", "diff", "dockerfile", "dot", "go", "http", "bash", "markdown_inline"
      },
      highlight = {
        enable = true
      },
      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 2000, -- Do not enable for files with more than n lines, int
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
      indent = {
        enable = true,
      },
      autopairs = { { enable = true } },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = { ['<leader>a'] = '@parameter.inner' },
          swap_previous = { ['<leader>A'] = '@parameter.inner' },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { [']a'] = '@parameter.outer', [']f'] = '@function.outer', [']c'] = '@class.outer' },
          goto_next_end = { [']A'] = '@parameter.outer', [']F'] = '@function.outer', [']C'] = '@class.outer' },
          goto_previous_start = { ['[a'] = '@parameter.outer', ['[f'] = '@function.outer', ['[c'] = '@class.outer' },
          goto_previous_end = { ['[A'] = '@parameter.outer', ['[F'] = '@function.outer', ['[C'] = '@class.outer' },
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          peek_definition_code = {
            ["df"] = "@function.outer",
            ["dF"] = "@class.outer",
          },
        },
      },
    })
  end,
}

return M
