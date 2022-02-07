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
require "paq" {
  {'savq/paq-nvim', opt = true}; -- packages
--
-- theme and visual
  -- 'catppuccin/nvim';
  -- For Packer
  'EdenEast/nightfox.nvim';
  'kyazdani42/nvim-web-devicons'; -- idcons
--
-- lsp
  'neovim/nvim-lspconfig'; -- lsp
  'onsails/lspkind-nvim';
  'ray-x/lsp_signature.nvim';
  'folke/trouble.nvim';
--
-- completion
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-nvim-lua';
  'hrsh7th/cmp-nvim-lsp';
  'saadparwaiz1/cmp_luasnip';
  'L3MON4D3/LuaSnip'; -- Snippets plugin
--
-- status line
  'hoob3rt/lualine.nvim'; -- status line
--
-- treesitter
  {'nvim-treesitter/nvim-treesitter', run=TSUpdate}; -- tresistter
  'nvim-treesitter/nvim-treesitter-textobjects'; -- treesiter text objects
  'p00f/nvim-ts-rainbow';
--
-- telescope
  'nvim-lua/plenary.nvim';
  'nvim-lua/popup.nvim';
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzf-native.nvim', run='make'} ;
  'nvim-telescope/telescope-file-browser.nvim';
-- 'LinArcX/telescope-command-palette.nvim';
--
-- autopairs
  'windwp/nvim-autopairs';
--
-- comments
  'numToStr/Comment.nvim';
--
-- start screens
  'goolord/alpha-nvim';
--
-- terminal management
  'akinsho/nvim-toggleterm.lua';
--
-- git signs
  'lewis6991/gitsigns.nvim';
--
-- key mapping help
  'folke/which-key.nvim';
-- quick fix toogle
  'stevearc/qf_helper.nvim';
-- easymotion movement
  'phaazon/hop.nvim';
-- surround stuff
  'blackCauldron7/surround.nvim';

-- file tree
  'kyazdani42/nvim-tree.lua';

-- markdown
  'ellisonleao/glow.nvim';

-- dap
  'mfussenegger/nvim-dap';
  'nvim-telescope/telescope-dap.nvim';
  'mfussenegger/nvim-dap-python';
  'theHamsta/nvim-dap-virtual-text';
  'rcarriga/nvim-dap-ui';
  'Pocco81/DAPInstall.nvim';
-- 'vim-test/vim-test';
  'David-Kunz/jester';
}
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

require('trouble-cfg')
