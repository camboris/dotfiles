local fn = vim.fn
local execute = vim.api.nvim_command

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
})

packer.startup(function(use)
  -- actual plugins list
  use("wbthomason/packer.nvim")

  use({ "EdenEast/nightfox.nvim", config = get_config("nightfox") })

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = get_config("telescope"),
  })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  use({ "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree") })


  use({
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    event = "VimEnter",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({ "windwp/nvim-autopairs", config = get_config("autopairs") })

  use({
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate",
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("p00f/nvim-ts-rainbow")

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use({ "neovim/nvim-lspconfig", config = get_config("lsp") })

  use({
    "ray-x/lsp_signature.nvim",
    require = { "neovim/nvim-lspconfig" },
    config = get_config("lsp-signature"),
 })

  use({ "onsails/lspkind-nvim", requires = { "famiu/bufdelete.nvim" } })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = get_config("null-ls"),
  })

  use({
    "akinsho/nvim-toggleterm.lua",
    keys = { "<C-n>", "<leader>fl", "<leader>gt" },
    config = get_config("toggleterm"),
  })

  use({ "folke/which-key.nvim", config = get_config("which") })

  use({ "RRethy/vim-illuminate", event = "CursorHold" })

  use({ "folke/zen-mode.nvim", cmd = "ZenMode", config = get_config("zen-mode") })

  use({ "ray-x/go.nvim", config = get_config("go"), ft = { "go" } })

  use({ "rcarriga/nvim-notify", config = get_config("notify") })

  use({
		"https://gitlab.com/yorickpeterse/nvim-window.git",
		config = get_config("nvim-window"),
	})

  use({
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = get_config("colorizer"),
	})

  	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
      { 'hrsh7th/cmp-nvim-lua' };
		},
		config = get_config("cmp"),
	})

	use({ "rafamadriz/friendly-snippets" })
	use({
		"L3MON4D3/LuaSnip",
		requires = "saadparwaiz1/cmp_luasnip",
		config = get_config("luasnip"),
	})

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    config = get_config("gitsigns"),
  })

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = get_config("alpha"),
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = get_config("hop"),
  }

end)
