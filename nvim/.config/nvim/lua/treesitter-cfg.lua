local ts = require("nvim-treesitter.configs")

ts.setup({ 
  ensure_installed = "maintained",
  highlight = { 
    enable = true 
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
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['aa'] = '@parameter.outer', ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer', ['if'] = '@function.inner',
        ['ac'] = '@class.outer', ['ic'] = '@class.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {['<leader>a'] = '@parameter.inner'},
      swap_previous = {['<leader>A'] = '@parameter.inner'},
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {[']a'] = '@parameter.outer', [']f'] = '@function.outer', [']c'] = '@class.outer'},
      goto_next_end = {[']A'] = '@parameter.outer', [']F'] = '@function.outer', [']C'] = '@class.outer'},
      goto_previous_start = {['[a'] = '@parameter.outer', ['[f'] = '@function.outer', ['[c'] = '@class.outer'},
      goto_previous_end = {['[A'] = '@parameter.outer', ['[F'] = '@function.outer', ['[C'] = '@class.outer'},
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

