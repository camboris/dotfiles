--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     surr*ound_words             ysiw(           ( surround_words )
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
local surround = {
  src = "gh:kylechui/nvim-surround",
  version = vim.version.range("4.x"), -- Use for stability; omit to use `main` branch for the latest features
  setup = function()
    require('nvim-surround').setup()
  end
}

local autopairs = {
  src = "gh:windwp/nvim-autopairs",
  setup = function()
    require("nvim-autopairs").setup {
      check_ts = true,
      fast_wrap = {},
    }
  end
}

local gitsigns = {
  src = 'gh:lewis6991/gitsigns.nvim',
  setup = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end,
          { desc = "Next Hunk" }
        )

        map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end,
          { desc = "Next Hunk" }
        )

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk,
          { desc = "Stage Hunk" })
        map('n', '<leader>hr', gitsigns.reset_hunk,
          { desc = "Reset Hunk" })

        map('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end,
          { desc = "Stage Hunk" })

        map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end,
          { desc = "Reset Hunk" })

        map('n', '<leader>hS', gitsigns.stage_buffer,
          { desc = "Stage Buffer" })
        map('n', '<leader>hR', gitsigns.reset_buffer,
          { desc = "Reset Buffer" })
        map('n', '<leader>hp', gitsigns.preview_hunk,
          { desc = "Preview Hunk" })
        map('n', '<leader>hi', gitsigns.preview_hunk_inline,
          { desc = "Preview Hunk Inline" })

        map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
          end,
          { desc = "Blame Line" })

        map('n', '<leader>hd', gitsigns.diffthis,
          { desc = "Diff This" })

        map('n', '<leader>hD', function()
          gitsigns.diffthis('~')
        end,
          { desc = "Diff This ~" })

        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end,
          { desc = "Blame Line" })
        map('n', '<leader>hq', gitsigns.setqflist,
          { desc = "Set Quickfix List" })

        -- Toggles
        map('n', '<leader>htb', gitsigns.toggle_current_line_blame,
          { desc = "Toggle Blame Line" })
        map('n', '<leader>htw', gitsigns.toggle_word_diff,
          { desc = "Toggle Word diff" })

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk,
          { desc = "Select Hunk" })
      end
    }
  end
}

return {
  gitsigns,
  autopairs,
  surround,
}
