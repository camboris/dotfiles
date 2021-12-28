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
--
-- theme and visual
paq {'catppuccin/nvim'}
paq {'kyazdani42/nvim-web-devicons'} -- idcons
--
-- lsp
paq {'neovim/nvim-lspconfig'} -- lsp
paq {'onsails/lspkind-nvim'}
paq {'ray-x/lsp_signature.nvim'}
--
-- completion
paq {'hrsh7th/nvim-cmp'}
paq {'hrsh7th/cmp-buffer'}
paq {'hrsh7th/cmp-path'}
paq {'hrsh7th/cmp-nvim-lua'}
paq {'hrsh7th/cmp-nvim-lsp'}
paq {'saadparwaiz1/cmp_luasnip'}
paq {'L3MON4D3/LuaSnip'} -- Snippets plugin
--
-- status line
paq {'hoob3rt/lualine.nvim'} -- status line
--
-- treesitter
paq {'nvim-treesitter/nvim-treesitter', run=TSUpdate} -- tresistter
paq {'nvim-treesitter/nvim-treesitter-textobjects'} -- treesiter text objects
--
-- telescope
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-fzf-native.nvim', run='make' }
-- paq {'LinArcX/telescope-command-palette.nvim'}
--
-- autopairs
paq {'windwp/nvim-autopairs'}
--
-- comments
paq {'numToStr/Comment.nvim'}
--
-- start screens
paq {'goolord/alpha-nvim'}
--
-- terminal management
paq {'akinsho/nvim-toggleterm.lua'}
--
-- git signs
paq {'lewis6991/gitsigns.nvim'}
--
-- key mapping help
paq {'folke/which-key.nvim'}
-- quick fix toogle
paq {'stevearc/qf_helper.nvim'}
-- easymotion movement
paq {'phaazon/hop.nvim'}
-- surround stuff
paq {'blackCauldron7/surround.nvim'}

-- file tree
paq {'kyazdani42/nvim-tree.lua'}

-- markdown
paq {'ellisonleao/glow.nvim'}

-- dap
paq {'mfussenegger/nvim-dap'}
paq {'nvim-telescope/telescope-dap.nvim'}
paq {'mfussenegger/nvim-dap-python'}
paq {'theHamsta/nvim-dap-virtual-text'}
paq {'rcarriga/nvim-dap-ui'}
paq {'Pocco81/DAPInstall.nvim'}
-- paq {'vim-test/vim-test'}
paq {'David-Kunz/jester'}
--
-- theme
require('theme-cfg')

-- lua-line
require('lualine-cfg')

-- tresitter
require('treesitter-cfg')

-- lsp
require('lsp-cfg')

-- options
require('options-cfg')
require('mappings-cfg')

-- telescope
require('telescope-cfg')

-- autoparis
require('autopairs-cfg')

-- comment
require('Comment').setup()

-- start screen
require'alpha'.setup(require'alpha.themes.startify'.opts)

-- terminal
require('toggleterm-cfg')

-- gitsifng
require('gitsigns').setup()

require('which-key').setup()

require('cmp-cfg')

require('qf-helper-cfg')

-- surround
require('surround').setup {
  mappings_style = 'surround'
}
-- hop
require('hop').setup()
api.nvim_set_keymap('n', 's', '<cmd>HopChar2<CR>', {})

vim.g.nvim_tree_quit_on_open = 1
require'nvim-tree'.setup()
-- api.nvim_set_keymap('n', '<F3>', '<cmd>NvimTreeToggle<CR>', {})
api.nvim_set_keymap('n', '<F3>', '<cmd>NvimTreeFindFileToggle<CR>', {})

-- Glow
api.nvim_set_keymap('n', '<leader>p', '<cmd>Glow<CR>', {})

require('dbg')
