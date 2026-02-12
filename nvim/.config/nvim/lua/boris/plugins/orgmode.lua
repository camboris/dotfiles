local superagenda = {
  'hamidi-dev/org-super-agenda.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-orgmode/orgmode',
  },
  config = function()
    require('org-super-agenda').setup({
      org_directories = { "~/orgfiles/" }
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
      -- org_agenda_files = '~/orgfiles/**/*',
      org_agenda_files =
      '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/**/*',
      org_default_notes_file =
      '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/refile.org',
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
      "~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles",
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

        p = {
          name = "person",
          description = "Person / Contact note",
          template = [==[
* %[title]                          :person:contact:
:PROPERTIES:
:NAME: %[title]
:ALIAS: %^{Aliases|}             ; comma-separated
:ROLE: %^{Role|}
:TEAM: %^{Team|}
:EMAIL: %^{Email|}
:SLACK_PROFILE: %^{Slack profile URL|}  ; paste full URL if available
:LOCATION: %^{Location|}
:CREATED: %U
:END:

** Summary
- One-line summary

** Notes
- %?

]==],
          target = "people/%[slug].org"
        },
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
              properties = { empty_lines = { before = 1 } },
            },
            n = {
              description = "Nota",
              template = "* %T - %?",
              target = "%<%Y-%m-%d>.org",
              properties = { empty_lines = { before = 1 } },
            },

            m = {
              description = 'Meeting',
              template = [==[
* %? %u                                      :meetings:
:PROPERTIES:
:ID: %(return require'orgmode.org.id'.new())
:DATE: %<%Y-%m-%d>
:START: %^{Start time|%<%Y-%m-%d %a %H:%M>}
:END:
- tags :: [[id:C19D5019-22F2-4447-866A-20015DAD7C25][#meetings]]
        ]==],
              target = "%<%Y-%m-%d>.org",
              properties = { empty_lines = { before = 1 } },
            },
            t = {
              description = 'Tactical',
              subtemplates = {
                g = {
                  description = 'Gera',
                  template = [==[
* Tactical Gera %t                                :tactical:
:PROPERTIES:
:ID: %(return require'orgmode.org.id'.new())
:DATE: %<%Y-%m-%d>
:START: %^{Start time|%<%Y-%m-%d %a %H:%M>}
:END:
  - tags :: [[id:5262609C-3917-41B6-A334-DD25B5F91AF8][#tactical]] [[id:FD763F2D-02D0-4876-B099-F54EE88A2C8D][Gerardo Daniel Zachary]]

** %?
]==],
                  target = "daily/%<%Y-%m-%d>.org",
                  properties = { empty_lines = { before = 1 } },

                },
                j = {
                  description = 'Joaco',
                  template = [==[
* Tactical Joaco %t                                :tactical:
:PROPERTIES:
:ID: %(return require'orgmode.org.id'.new())
:DATE: %<%Y-%m-%d>
:START: %^{Start time|%<%Y-%m-%d %a %H:%M>}
:END:
  - tags :: [[id:5262609C-3917-41B6-A334-DD25B5F91AF8][#tactical]] [[id:5A9AAA4B-3888-48D9-A936-BDA13C4E965B][Joaquin Miguel Molina Waldrop]]

** %?
]==],
                  target = "daily/%<%Y-%m-%d>.org",
                  properties = { empty_lines = { before = 1 } },

                }
              }
            }
          },
        },
      },
    })
  end
}

return {
  orgmode,
  roam,
  -- headlines,
  orgbullets,
  telescopeorgmode,
  telescopeorgroam,
  -- superagenda,
}
