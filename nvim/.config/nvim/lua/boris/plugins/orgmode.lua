local superagenda = {
  'hamidi-dev/org-super-agenda.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-orgmode/orgmode',
  },
  keys = {
    { "<leader>os", "cmd>OrgSuperAgenda<cr>",  desc = "OrgMode Super Agenda" },
    { "<leader>oS", "cmd>OrgSuperAgenda!<cr>", desc = "OrgMode Super Agenda Full Screen" },
  },
  config = function()
    require('org-super-agenda').setup({
      org_directories = { "~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/" },
      org_files       = { '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/**/*' },
    })
  end
}

local telescopeorgmode = {
  "nvim-orgmode/telescope-orgmode.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-orgmode/orgmode",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>foh", "<cmd>Telescope orgmode search_headings<cr>", desc = "OrgMode Find Headings" },
    { "<leader>for", "<cmd>Telescope orgmode refile_heading<cr>",  desc = "OrgMode Refile Headings" },
    { "<leader>foi", "<cmd>Telescope orgmode insert_link<cr>",     desc = "OrgMode Insert Link" },
    { "<leader>fot", "<cmd>Telescope orgmode search_tags<cr>",     desc = "OrgMode Search Tags" },
  },
  config = function()
    require("telescope").load_extension("orgmode")
  end,
}

local telescopeorgroam = {
  "bi0ha2ard/telescope-org_roam.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-orgmode/orgmode",
    "nvim-telescope/telescope.nvim",
    "chipsenkbeil/org-roam.nvim",
  },
  keys = {
    { "<leader>fon", "<cmd>Telescope org_roam find_nodes<cr>",                      desc = "OrgRoam Find Nodes" },
    { "<leader>fol", "<cmd>Telescope org_roam links<cr>",                           desc = "OrgRoam Show Links" },
    { "<leader>fob", "<cmd>Telescope org_roam links backlinks=true<cr>",            desc = "OrgRoam BackLinks" },
    { "<leader>foa", "<cmd>Telescope org_roam links links=true backlinks=true<cr>", desc = "OrgRoam Links - Backlinks" },
  },
  config = function()
    require('telescope').load_extension('org_roam')
  end
}

local headlines = {
  "lukas-reineke/headlines.nvim",
  ft = "org",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true, -- or `opts = {}`
}

local orgbullets = {
  "nvim-orgmode/org-bullets.nvim",
  event = "VeryLazy",
  opts = {},
}

local orgmode = {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  keys = {
    { "<leader>odc", ":lua require('orgmode').action('org_mappings.toggle_checkbox')<CR>", desc = "OrgMode toggle checkbox" },
  },
  config = function()
    require('orgmode').setup({
      org_agenda_files =
      '~/orgfiles/**/*',
      org_default_notes_file =
      '~/orgfiles/refile.org',
      mappings = {
        org_return_uses_meta_return = true
      },
    })
  end,
}

local roam = {
  "chipsenkbeil/org-roam.nvim",
  event = 'VeryLazy',
  tag = "0.2.0",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.7.0",
    },
    { "nvim-orgmode/org-bullets.nvim", }
  },

  config = function()
    require("org-roam").setup({
      -- directory = "~/org_roam_files",
      directory =
      "~/orgfiles",
      -- optional
      -- org_files = {
      --   "~/another_org_dir",
      --   "~/some/folder/*.org",
      --   "~/a/single/org_file.org"
      --
      ui = {
        node_buffer = {
          show_keybindings = true,
        },
      },
      templates = {
        d = {
          description = "default",
          template = "%?",
          target = "%<%Y%m%d%H%M%S>-%[slug].org",
        },

        extensions = {
          dailies = {
            bindings = {
              capture_today = "<leader>ndc",
            },
            templates = {
              o = {
                description = "todo",
                template = "TODO %?\nCreated %T",
                target = "%<%Y-%m-%d>.org",
              },
              n = {
                description = "Nota",
                template = "* %T - %?",
                target = "%<%Y-%m-%d>.org",
              },
            },
          },
        },
      },
    })
  end
}

-- * [[id:5262609C-3917-41B6-A334-DD25B5F91AF8][#tactical]]
return {
  orgmode,
  roam,
  -- headlines,
  orgbullets,
  telescopeorgmode,
  telescopeorgroam,
  superagenda,
}
