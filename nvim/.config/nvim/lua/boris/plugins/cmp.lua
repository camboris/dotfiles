local luasnip = {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      ls.add_snippets("markdown", {
        s({
            trig = "ing",
            name = "RecipeMD Ingredient"
          },
          {
            t("- *"), i(1, "qty unit"), t("* "), i(2, "Ingredient")
          }
        ),
        s({
          trig = "5xrow",
          name = "Markdown table row 5 columns"
        }, {
          t("| "), i(1, "col1"), t(" | "), i(2, "col2"), t(" | "), i(3, "col3"), t(" | "), i(4, "col4"), t(" | "),
          i(5, "col5"), t(" |")
        }),
      })
      ls.add_snippets("plantuml", require("boris/snippets/plantuml").plantuml)

    end,
  },
  opts = {
    history = true,
    -- delete_check_events = "TextChanged",
    updateevents = "TextChanged,TextChangedI",
  },
  -- stylua: ignore
  keys = {
    --   {
    --     "<tab>",
    --     function()
    --       return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
    --     end,
    --     expr = true,
    --     silent = true,
    --     mode = "i",
    --   },
    --   { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
    --   { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    {
      "<c-k>",
      function()
        local ls = require("luasnip")
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      silent = true,
      mode = { "i", "s" }
    },
    {
      "<c-h>",
      function()
        local ls = require("luasnip")
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      silent = true,
      mode = { "i", "s" }
    },
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
    "hrsh7th/cmp-cmdline",
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
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-y>'] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { "i", "c" }
        )
        -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-u>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete({}),
        -- ["<C-e>"] = cmp.mapping.close(),
        -- ["<CR>"] = cmp.mapping.confirm({
        -- behavior = cmp.ConfirmBehavior.Replace,
        -- select = false,
        -- }),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        -- ["<S-Tab>"] = cmp.mapping(function()
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   end
        -- end, { "i", "s" }),
      },
      window = {
        completion = cmp.config.window.bordered({
          border = 'single',
          col_offset = -1,
          scrollbar = false,
          scrolloff = 3,
          -- Default for bordered() is 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
          -- Default for non-bordered, which we'll use here, is:
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
        }),
        documentation = cmp.config.window.bordered({
          border = 'solid',
          scrollbar = false,
          -- Default for bordered() is 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
          -- Default for non-bordered is 'FloatBorder:NormalFloat'
          -- Suggestion from: https://github.com/hrsh7th/nvim-cmp/issues/2042
          -- is to use 'NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
          -- but this also seems to suffice:
          winhighlight = 'CursorLine:Visual,Search:None',
        }),
      },
      sources = {
        { name = "nvim_lsp" },
        {
          name = "buffer",
          keyword_length = 3
        },
        -- { name = 'nvim_lsp_signature_help' },
        { name = "luasnip" },
        { name = 'nvim_lua' },
        { name = "path" },
        { name = "emoji" },
        { name = "neorg" },
        {
          name = 'spell',
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
    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })
  end
}

return {
  cmp,
  luasnip
}
