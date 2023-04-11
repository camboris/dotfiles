local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "folke/neodev.nvim",
    -- "j-hui/fidget.nvim",

  },
  event = "BufRead",
  config = function()
    -- injects neovim definicions on config files
    require("neodev").setup({})
    -- shows lsp loading status
    -- require('fidget').setup()

    -- servers config for mason and lsp
    local servers = {
      -- clangd = {},
      gopls = {},
      pyright = {},
      -- rust_analyzer = {},
      eslint = {},
      tsserver = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }
    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>fm', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
    end
    -- nvim cmp capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("mason").setup()
    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    -- mason lsp config stuff
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }

    -- mason dap stuff
    local dap_sources = {
      debugpy = {},
      delve = {},
    }
    local mason_dap = require("mason-nvim-dap")
    mason_dap.setup({
      ensure_installed = vim.tbl_keys(dap_sources),
      automatic_setup = true,
    })
    -- mason_dap.setup_handlers()
  end
}
return M
