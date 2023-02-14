local local_highlight = {
    'tzachar/local-highlight.nvim',
    ft = {"go", "lua", "js", "python"},
    config = function()
      require('local-highlight').setup({
          file_types = { 'python', 'js', 'go', "lua" },
          hlgroup = 'IlluminatedWordText',
      })
    end
}

local dap = {
    "mfussenegger/nvim-dap",
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
    golang,
    dap,
    local_highlight,
}
