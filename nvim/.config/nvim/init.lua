local api = vim.api
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

--- install paq-nvim
local install_path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone --depth=1 https://github.com/savq/paq-nvim.git ' .. install_path)
end


--- plugins
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true} -- packages
paq {'sainnhe/sonokai'} -- theme
paq {'neovim/nvim-lspconfig'} -- lsp
paq {'ray-x/lsp_signature.nvim'}
paq {'hrsh7th/nvim-compe'} -- completion
paq {'hoob3rt/lualine.nvim'} -- status line
paq {'kyazdani42/nvim-web-devicons'} -- idcons
paq {'nvim-treesitter/nvim-treesitter'} -- tresistter
paq {'nvim-treesitter/nvim-treesitter-textobjects'} -- treesiter text objects
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'windwp/nvim-autopairs'}
paq {'terrortylor/nvim-comment'}
paq {'glepnir/dashboard-nvim'}
paq {'akinsho/nvim-toggleterm.lua'}
paq {'lewis6991/gitsigns.nvim'}
paq {'folke/which-key.nvim'}

-- lua-line
require('lualine-cfg')

-- tresitter
require('treesitter-cfg')

-- lsp
require('lsp-cfg')

-- compe
require('compe-cfg')

-- options
require('options-cfg')
require('mappings-cfg')

-- theme
require('theme-cfg')

-- telescope
require('telescope-cfg')

-- autoparis
require('autopairs-cfg')

-- comment
require('nvim_comment').setup()

-- dashboard
g.dashboard_default_executive = 'telescope'

-- terminal
require('toggleterm-cfg')

-- gitsifng
require('gitsigns').setup()

require('which-key').setup()
