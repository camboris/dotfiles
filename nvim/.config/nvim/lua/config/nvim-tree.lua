local map = vim.keymap.set
require'nvim-tree'.setup({
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})
map('n', '<F3>', '<cmd>NvimTreeFindFileToggle<CR>', {})

