local plantuml = {
  "aklt/plantuml-syntax"
}

local neotest = {
  "nvim-neotest/neotest",
  ft = { "go", "lua", "js", "python" },
  -- event = "BufRead",
  keys = {
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    {
      "<leader>tT",
      function() require("neotest").run.run(vim.loop.cwd()) end,
      desc =
      "Run All Test Files"
    },
    {
      "<leader>tr",
      function() require("neotest").run.run() end,
      desc =
      "Run Nearest"
    },
    { "<leader>tl", function() require("neotest").run.run_last() end,              desc = "Run Last" },
    {
      "<leader>ts",
      function() require("neotest").summary.toggle() end,
      desc =
      "Toggle Summary"
    },
    {
      "<leader>to",
      function() require("neotest").output.open({ enter = true, auto_close = true }) end,
      desc =
      "Show Output"
    },
    {
      "<leader>tO",
      function() require("neotest").output_panel.toggle() end,
      desc =
      "Toggle Output Panel"
    },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
  },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    'nvim-neotest/neotest-jest'
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-jest')({
          -- jestCommand = "npm run test:unit --",
          jestConfigFile = "jest.config.js",
          env = { CI = true, NODE_ENV = "test" },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      }
    })
  end
}

local gitconflict = {
  'akinsho/git-conflict.nvim',
  event = "BufRead",
  version = "*",
  config = true
}

local openingh = {
  {
    "almo7aya/openingh.nvim",
    cmd = {
      "OpenInGHRepo",
      "OpenInGHFile"
    },
    keys = {
      { "<leader>gf", "<cmd>OpenInGHFile<CR>", desc = "Open file in Github repo" }
    }
  },
}

local comment = {
  {
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
      require('Comment').setup()
    end
  }
}

local harpoon = {
  'ThePrimeagen/harpoon',
  -- event = 'BufRead',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
  keys = {
    { "<leader>ja", function() require("harpoon.mark").add_file() end,            desc = "Harpoon Add File" },
    { "<leader>jm", function() require("harpoon.ui").toggle_quick_menu() end,     desc = "Harpoon File Menu" },
    { "<leader>jc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, desc = "Harpoon Command Menu" },
    { "<leader>jh", function() require("harpoon.ui").nav_file(1) end,             desc = "Harpoon File 1" },
    { "<leader>jj", function() require("harpoon.ui").nav_file(2) end,             desc = "Harpoon File 2" },
    { "<leader>jk", function() require("harpoon.ui").nav_file(3) end,             desc = "Harpoon File 3" },
    { "<leader>jl", function() require("harpoon.ui").nav_file(4) end,             desc = "Harpoon Fil 4" },
  },
  opts = {
    global_settings = {
      save_on_toggle = true,
      enter_on_sendcmd = true,
    },
  },
  config = function()
    require("telescope").load_extension('harpoon')
  end
}

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
  -- event = "BufRead",
  ft = { "go", "lua", "js", "python" },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    -- Install the vscode-js-debug adapter
    {
      "microsoft/vscode-js-debug",
      -- After install, build it and rename the dist directory to out
      build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      version = "1.*",
    },
    "mxsdev/nvim-dap-vscode-js",

  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dapgo = require("dap-go")
    local dapvt = require("nvim-dap-virtual-text")
    local dappy = require('dap-python')
    local dapvscodejs = require('dap-vscode-js')

    -- Dap Python
    dappy.setup()
    -- dap virtual text
    dapvt.setup({})

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    -- go
    dapgo.setup()
    require('telescope').load_extension("dap")

    -- js
    dapvscodejs.setup({
      -- Path to vscode-js-debug installation.
      debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    })

    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require 'dap.utils'.pick_process,
          cwd = "${workspaceFolder}",
        } }
    end
  end,
  keys = {
    { "<leader>dct", '<cmd>lua require"dap".continue()<CR>',            desc = "Debug Continue" },
    { "<leader>dsv", '<cmd>lua require"dap".step_over()<CR>',           desc = "Debug Step Over" },
    { "<leader>dsi", '<cmd>lua require"dap".step_into()<CR>',           desc = "Debug Step Into" },
    { "<leader>dso", '<cmd>lua require"dap".step_out()<CR>',            desc = "Debug Step Out" },
    { "<leader>dtb", '<cmd>lua require"dap".toggle_breakpoint()<CR>',   desc = "Debug Toggle Breakpoint" },
    { "<leader>dsc", '<cmd>lua require"dap.ui.variables".scopes()<CR>', desc = "Debug UI variables Scopes" },
    { "<leader>dhh", '<cmd>lua require"dap.ui.variables".hover()<CR>',  desc = "Debug UI variables Hover" },
    {
      "<leader>dhv",
      '<cmd>lua require"dap.ui.variables".visual_hover()<CR>',
      desc = "Debug UI Visual Hover",
      mode =
      "v"
    },
    { "<leader>duh", '<cmd>lua require"dap.ui.widgets".hover()<CR>', desc = "Debug UI widgets Hover" },
    {
      "<leader>duf",
      "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
      desc = "Debug UI Widgets Float"
    },
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
    { "<leader>dro", '<cmd>lua require"dap".repl.open()<CR>',        desc = "Debug REPL Open" },
    { "<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>',    desc = "Debug REPL Run" },
    { '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>',         desc = "Toggle Debug UI" },
  }
}


local golang = {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  -- event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  config = function()
    require('go').setup()
  end
}

-- local copilot = {
--   "github/copilot.vim",
--   ft = { "go", "gomod" },
--   config = function()
--     vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--     vim.g.copilot_no_tab_map = true
--   end
-- }

local copilot = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  ft = { "go", "gomod", "lua", "python" },
  -- event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",
          accept_word = false,
          accept_line = false,
          next = "<C-n>",
          prev = "<C-p>",
          dismiss = "<C-/>",
        },
      },
      -- panel = {
      --   enabled = false
      -- },
    })
  end,
}

return {
  -- comment,
  copilot,
  dap,
  gitconflict,
  gitsigns,
  golang,
  harpoon,
  local_highlight,
  neotest,
  openingh,
  plantuml,
}
