local gitsigns = {
  'lewis6991/gitsigns.nvim',
  event = "BufRead",
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = "Git Next Hunk" })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = "Git Previous Hunk" })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = "Git Stage Hunk" })
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = "Git Reset Hunk" })
        map('n', '<leader>hS', gs.stage_buffer, { desc = "Git Stage Buffer" })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Git Undo Stage Hunk" })
        map('n', '<leader>hR', gs.reset_buffer, { desc = "Git Reset Buffer" })
        map('n', '<leader>hp', gs.preview_hunk, { desc = "Git Preview Hunk" })
        map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = "Git Blames Line" })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Git Toggle Current Line Blame" })
        map('n', '<leader>hd', gs.diffthis, { desc = "Git Diff This" })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Git Stage Hunk" })
        map('n', '<leader>td', gs.toggle_deleted, { desc = "Git Stage Hunk" })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Git Stage Hunk" })
      end
    }
  end,
}

local local_highlight = {
  'tzachar/local-highlight.nvim',
  ft = { "go", "lua", "js", "python" },
  config = function()
    require('local-highlight').setup({
      file_types = { 'python', 'js', 'go', "lua" },
      hlgroup = 'IlluminatedWordText',
    })
  end
}

local dap = {
  "mfussenegger/nvim-dap",
  event = "BufRead",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dapgo = require("dap-go")
    local dapvt = require("nvim-dap-virtual-text")
    local dappy = require('dap-python')

    -- Dap Python
    dappy.setup()
    -- dap virtual text
    dapvt.setup({})

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- go
    dapgo.setup()
  end,
  keys = {
    { "<leader>dct", '<cmd>lua require"dap".continue()<CR>',                  desc = "Debug Continue" },
    { "<leader>dsv", '<cmd>lua require"dap".step_over()<CR>',                 desc = "Debug Step Over" },
    { "<leader>dsi", '<cmd>lua require"dap".step_into()<CR>',                 desc = "Debug Step Into" },
    { "<leader>dso", '<cmd>lua require"dap".step_out()<CR>',                  desc = "Debug Step Out" },
    { "<leader>dtb", '<cmd>lua require"dap".toggle_breakpoint()<CR>',         desc = "Debug Toggle Breakpoint" },
    { "<leader>dsc", '<cmd>lua require"dap.ui.variables".scopes()<CR>',       desc = "Debug UI variables Scopes" },
    { "<leader>dhh", '<cmd>lua require"dap.ui.variables".hover()<CR>',        desc = "Debug UI variables Hover" },
    { "<leader>dhv", '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', desc = "Debug UI Visual Hover",    mode = "v" },
    { "<leader>duh", '<cmd>lua require"dap.ui.widgets".hover()<CR>',          desc = "Debug UI widgets Hover" },
    {
      "<leader>duf", "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
      desc = "Debug UI Widgets Float" },
    {
      "<leader>dsbr",
      '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
      desc = "Debug Set Breakpoint Condition"
    },
    {
      "<leader>dsbm",
      '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
      desc = "Debug Set Breakpoint Message"
    },
    { "<leader>dro", '<cmd>lua require"dap".repl.open()<CR>',     desc = "Debug REPL Open" },
    { "<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>', desc = "Debug REPL Run" },
    { '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>',      desc = "Toggle Debug UI" },
  }
}


local golang = {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua" -- recommended if need floating window support
  },
  ft = { "go", },
  config = function()
    require('go').setup()
  end
}

return {
  dap,
  gitsigns,
  golang,
  local_highlight,
}
