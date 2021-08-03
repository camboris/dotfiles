local api = vim.api
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

--- install paq-nvim
local install_path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone --depth=1 https://github.com/savq/paq-nvim.git ' .. install_path)
end
-- print(install_path)


--- plugins
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true} -- packages
paq {'sainnhe/sonokai'} -- theme
paq {'neovim/nvim-lspconfig'} -- lsp
paq {'hrsh7th/nvim-compe'} -- completion
paq {'hoob3rt/lualine.nvim'} -- status line
paq {'kyazdani42/nvim-web-devicons', opt = true} -- idcons
paq {'nvim-treesitter/nvim-treesitter'} -- tresistter
paq {'nvim-treesitter/nvim-treesitter-textobjects'} -- treesiter text objects

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

-- theme
require('theme-cfg')
