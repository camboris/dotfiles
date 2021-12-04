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
-- paq {'sainnhe/sonokai'} -- theme
paq {'catppuccin/nvim'}
paq {'neovim/nvim-lspconfig'} -- lsp
paq {'ray-x/lsp_signature.nvim'}
-- completion
paq {'hrsh7th/nvim-cmp'}
paq {'hrsh7th/cmp-buffer'}
paq {'hrsh7th/cmp-path'}
paq {'hrsh7th/cmp-nvim-lua'}
paq {'hrsh7th/cmp-nvim-lsp'}
paq {'saadparwaiz1/cmp_luasnip'}
paq {'onsails/lspkind-nvim'}
paq {'L3MON4D3/LuaSnip'} -- Snippets plugin
paq {'hoob3rt/lualine.nvim'} -- status line
paq {'kyazdani42/nvim-web-devicons'} -- idcons
paq {'nvim-treesitter/nvim-treesitter', run=TSUpdate} -- tresistter
paq {'nvim-treesitter/nvim-treesitter-textobjects'} -- treesiter text objects
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'windwp/nvim-autopairs'}
paq {'numToStr/Comment.nvim'}
paq {'goolord/alpha-nvim'}
paq {'akinsho/nvim-toggleterm.lua'}
paq {'lewis6991/gitsigns.nvim'}
paq {'folke/which-key.nvim'}
paq {'stevearc/qf_helper.nvim'}
paq {'nvim-telescope/telescope-fzf-native.nvim', run='make' }
paq {'phaazon/hop.nvim'}
paq {'blackCauldron7/surround.nvim'}


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
-- -- place this in one of your configuration file(s)
-- vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
api.nvim_set_keymap('n', 's', '<cmd>HopChar2<CR>', {})
