local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "folke/neodev.nvim",
  },
  event = "BufRead",
  config = function()
    -- injects neovim definicions on config files
    require("neodev").setup({})

    -- servers config for mason and lsp
    local servers = {
      -- clangd = {},
      gopls = {
        gopls = {
          ["ui.inlayhint.hints"] = {
            compositeLiteralFields = true,
            constantValues = true,
            parameterNames = true,
            functionTypeParameters = true,
          },
        },

      },
      -- pyright = {},
      -- rust_analyzer = {},
      -- eslint = {},
      -- tsserver = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          hint = { enable = true },
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
    -- lsp de plant uml, es lento e imcompleto
    -- https://github.com/ptdewey/plantuml-lsp
    -- local lspconfig = require("lspconfig")
    -- local configs = require("lspconfig.configs")
    -- if not configs.plantuml_lsp then
    --   configs.plantuml_lsp = {
    --     default_config = {
    --       cmd = {
    --         "/Users/mpozzo/desarrollo/boris/plantuml-lsp/plantuml_lsp",
    --         -- "--stdlib-path=/path/to/plantuml-stdlib",
    --
    --         --
    --         -- FOR DIAGNOSTICS (choose up to one of 'jar-path' and 'exec-path' flags):
    --         --
    --         -- Running plantuml via a .jar file:
    --         -- "--jar-path=/path/to/plantuml.jar",
    --         -- With plantuml executable and available from your PATH there is a simpler method:
    --         "--exec-path=plantuml",
    --       },
    --       filetypes = { "plantuml" },
    --       root_dir = function(fname)
    --         return lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
    --       end,
    --       settings = {},
    --     }
    --   }
    -- end
    -- lspconfig.plantuml_lsp.setup {}

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

    if vim.lsp.inlay_hint then
      vim.keymap.set(
        "n",
        "<leader>uh",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end,
        { desc = "Toggle inlay hints" }
      )
    end
  end
}
return M
