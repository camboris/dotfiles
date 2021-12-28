require('telescope').load_extension('dap')
-- nvim-dap-ui
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
require('dbg.python')
require('dbg.javascript')

vim.api.nvim_set_keymap('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', {})

vim.api.nvim_set_keymap('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>', {})
vim.api.nvim_set_keymap('v', '<leader>dhv', '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', {})

vim.api.nvim_set_keymap('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", {})

vim.api.nvim_set_keymap('n', '<leader>dsbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dsbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', {})


-- telescope-dap
vim.api.nvim_set_keymap('n', '<leader>dcc',
          '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dco',
          '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dlb',
          '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dv',
          '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>df',
          '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', {})

-- nvim-dap-virtual-text. Show virtual text for current frame
-- vim.g.dap_virtual_text = true

-- nvim-dap-ui
vim.api.nvim_set_keymap('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>', {})
