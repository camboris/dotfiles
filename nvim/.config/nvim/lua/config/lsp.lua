local nvim_lsp = require("lspconfig")
local navic = require("nvim-navic")

-- detect python venv
-- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-851247107
local util = require("lspconfig/util")
local path = util.path
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end
  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end
  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
  "pyright",
  "sumneko_lua",
  "tsserver",
  "jsonls",
  "gopls",
  "marksman",
  "rust_analyzer"
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use a loop to conveniently call 'setup' on multiple servers
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
        '<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<CR>', opts)

      -- disable formatting for LSP clients as this is handled by null-ls
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
    end,
    before_init = function(_, config)
      if lsp == "pyright" then
        config.settings.python.pythonPath = get_python_path(config.root_dir)
      end
    end,
    capabilities = capabilities,
    settings = {
      json = {
        format = { enabled = false },
        schemas = {
          {
            description = "ESLint config",
            fileMatch = { ".eslintrc.json", ".eslintrc" },
            url = "http://json.schemastore.org/eslintrc",
          },
          {
            description = "Package config",
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package",
          },
          {
            description = "Packer config",
            fileMatch = { "packer.json" },
            url = "https://json.schemastore.org/packer",
          },
          {
            description = "OpenApi config",
            fileMatch = { "*api*.json" },
            url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
          },
        },
      },
      Lua = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        completion = { enable = true, callSnippet = "Both" },
        diagnostics = {
          enable = true,
          globals = { "vim", "describe" },
          disable = { "lowercase-global" },
        },
        workspace = {
          library = {
            vim.api.nvim_get_runtime_file("", true),
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            [vim.fn.expand("/usr/share/awesome/lib")] = true,
          },
          -- adjust these two values if your performance is not optimal
          maxPreload = 2000,
          preloadFileSize = 1000,
        },
        telemetry = { enable = false },
      },
    },
    flags = { debounce_text_changes = 150 },
  })
end
