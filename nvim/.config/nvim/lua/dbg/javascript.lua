local dap = require "dap"
-- DIInstall jsnode

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {
        vim.fn.stdpath("data") .. "/dapinstall/jsnode/" ..
            '/vscode-node-debug2/out/src/nodeDebug.js'
    }
}

dap.configurations.javascript = {
    {
        type = 'node2',
        request = 'attach',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        skipFiles = { '<node_internals>/**' },
    }
}

-- configurar jester ponerle npx en el cmd al llamarlo
-- https://github.com/David-Kunz/jester
local jester_opts = {
  cmd = "npx jest -t '$result' -- $file", -- run command
}
vim.api.nvim_set_keymap('n', '<leader>dtd', '<cmd>lua require"jester".debug({cmd="npx jest -t \'$result\' -- $file"})<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dtr', '<cmd>lua require"jester".run({cmd="npx jest -t \'$result\' -- $file"})<CR>', {})
