local luasnip = {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<tab>",   function() require("luasnip").jump(1) end,   mode = "s" },
    { "<s-tab>", function() require("luasnip").jump( -1) end, mode = { "i", "s" } },
  },
}

local cmp = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-emoji",
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    "onsails/lspkind-nvim",
    "saadparwaiz1/cmp_luasnip",
    "f3fora/cmp-spell",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      experimental = { native_menu = false, ghost_text = true },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs( -4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer",
          keyword_length = 3 },
        -- { name = 'nvim_lsp_signature_help' },
        { name = "luasnip" },
        { name = 'nvim_lua' },
        { name = "path" },
        { name = "emoji" },
        { name = "neorg" },
        { name = 'spell',
          keyword_length = 3,
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              return true
            end,
          },
        },
      },
      formatting = {
        format = lspkind.cmp_format({
          with_text = true,
          maxwidth = 50,
          mode = "symbol_text",
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          menu = {
            buffer = "BUF",
            rg = "RG",
            nvim_lsp = "LSP",
            path = "PATH",
            luasnip = "SNIP",
            calc = "CALC",
            spell = "SPELL",
            emoji = "EMOJI",
          },
        })
      }
    })
  end
}

return {
  cmp,
  luasnip
}
