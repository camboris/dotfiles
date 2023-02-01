local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "j-hui/fidget.nvim",

  },
  event = "BufRead",
  config = function()
    require("neodev").setup({
      -- add any options here, or leave empty to use the default settings
    })
    require('fidget').setup()
    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- tsserver = {},

      sumneko_lua = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }
    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
    end
    -- nvim cmp capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason").setup()
    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

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
  end
}
return M
