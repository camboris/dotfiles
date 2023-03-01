local M = {
	"kyazdani42/nvim-tree.lua",
  keys = {
    {'<F3>', '<cmd>NvimTreeFindFileToggle<CR>', desc = "Opens Nvim Tree"}
  },
  config = function()
    require'nvim-tree'.setup({
      actions = {
        open_file = {
          quit_on_open = true,
        }
      }
    })
  end

}
return M
