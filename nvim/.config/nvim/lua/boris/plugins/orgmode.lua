local superagenda = {
  'hamidi-dev/org-super-agenda.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-orgmode/orgmode',
  },
  config = function()
    require('org-super-agenda').setup({
      org_files           = {
        '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/**/*',
      },
      org_directories     = {
        '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/',
      }, -- recurse for *.org
      exclude_files       = {},
      exclude_directories = {},
      show_other_group    = true,
      todo_states         = {
        { name = 'TODO',      keymap = 'ot', color = '#FF5555', strike_through = false, fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' } },
        { name = 'PING',      keymap = 'op', color = '#FFAA00', strike_through = false, fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' } },
        { name = 'WAITING',   keymap = 'ow', color = '#BD93F9', strike_through = false, fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' } },
        { name = 'NEXT',      keymap = 'on', color = '#BD93F9', strike_through = false, fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' } },
        { name = 'FOLLOW',    keymap = 'of', color = '#BD93F9', strike_through = false, fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' } },
        { name = 'DONE',      keymap = 'od', color = '#50FA7B', strike_through = true,  fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' } },
        { name = 'PINGED',    keymap = 'os', color = '#50FA7B', strike_through = true,  fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' } },
        { name = 'DELEGATED', keymap = 'oe', color = '#50FA7B', strike_through = true,  fields = { 'filename', 'todo', 'headline', 'priority', 'date', 'tags' } },
      },
      groups              = {
        { name = '📅 Today', matcher = function(i) return i.scheduled and i.scheduled:is_today() end, sort = { by = 'scheduled_time', order = 'asc' } },
        { name = '🗓️ Tomorrow', matcher = function(i) return i.scheduled and i.scheduled:days_from_today() == 1 end, sort = { by = 'scheduled_time', order = 'asc' } },
        {
          name = '☠️ Deadlines',
          matcher = function(i)
            return i.deadline and i.todo_state ~= 'DONE' and
                not i:has_tag('personal')
          end,
          sort = { by = 'deadline', order = 'asc' }
        },
        { name = '⭐ Important', matcher = function(i) return i.priority == 'A' and (i.deadline or i.scheduled) end, sort = { by = 'date_nearest', order = 'asc' } },
        {
          name = '⏳ Overdue',
          matcher = function(i)
            return i.todo_state ~= 'DONE' and
                ((i.deadline and i.deadline:is_past()) or (i.scheduled and i.scheduled:is_past()))
          end,
          sort = { by = 'date_nearest', order = 'asc' }
        },
        {
          name = '📆 Upcoming',
          matcher = function(i)
            local days = require('org-super-agenda.config').get().upcoming_days or 10
            local d1 = i.deadline and i.deadline:days_from_today()
            local d2 = i.scheduled and i.scheduled:days_from_today()
            return (d1 and d1 >= 0 and d1 <= days) or (d2 and d2 >= 0 and d2 <= days)
          end,
          sort = { by = 'date_nearest', order = 'asc' }
        },
      },
      custom_views        = {
        tactical_ivan = {
          name = "Tactical Ivan",
          keymap = "<leader>nti",
          filter = "tag:Ivan todo:PING",
        },
      },
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
      ui = {
        input = {
          use_vim_ui = true
        }
      },
      org_agenda_files =
      '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/**/*',
      org_default_notes_file =
      '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/refile.org',
      mappings = {
        org_return_uses_meta_return = true
      },
      win_split_mode = 'float',
      win_border = 'rounded',
      org_hide_emphasis_markers = true,
      -- TODO para tareas
      -- PING para contactar a alguien por un tema
      -- Waiting, esperando feedback o respuesta
      -- Next para encadenar tareas
      -- FOLLOW para recordar hacer un seguimiento de un tema
      -- DONE general
      -- PINGED para indicar que se hablo
      -- Delegated, para indicar que una tarea se la deje a alguien, indicar a quien
      org_todo_keywords = { 'TODO(t)', 'PING(p)', 'WAITING(w)', 'NEXT(n)', 'FOLLOW(f)', '|', 'DONE(d)', 'PINGED(s)', 'DELEGATED' },
      org_agenda_custom_commands = {
        x = {
          description = "Tacticals",
          types = {
            {
              type = 'tags_todo',
              org_agenda_overriding_header = 'Ivan',
              match = 'Ivan+TODO="PING"',
              -- match = 'Ivan',
            },
            {
              type = 'tags',
              match = 'Eze+TODO="PING"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = 'Eze',
            },
            {
              type = 'tags',
              match = 'Joaco+TODO="PING"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = 'Joaco',
            },
            {
              type = 'tags',
              match = 'Jona+TODO="PING"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = 'Jona',
            },
            {
              type = 'tags',
              match = 'Jorge+TODO="PING"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = 'Jorge',
            },
            {
              type = 'tags',
              match = 'Gera+TODO="PING"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = 'Gera',
            },
            {
              type = 'tags',
              match = 'Emi+TODO="PING"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = 'Emi',
            },
          },
        },
        c = {
          description = 'Vista Combinada', -- Description shown in the prompt for the shortcut
          types = {
            {
              type = 'tags_todo',                       -- Type can be agenda | tags | tags_todo
              match = '+PRIORITY="A"',                  --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = 'High priority todos',
              org_agenda_todo_ignore_deadlines = 'far', -- Ignore all deadlines that are too far in future (over org_deadline_warning_days). Possible values: all | near | far | past | future
            },
            {
              type = 'agenda',
              org_agenda_overriding_header = 'My daily agenda',
              org_agenda_span = 'day' -- can be any value as org_agenda_span
            },
            {
              type = 'agenda',
              org_agenda_overriding_header = 'Whole week overview',
              org_agenda_span = 'week',        -- 'week' is default, so it's not necessary here, just an example
              org_agenda_start_on_weekday = 1, -- Start on Monday
              org_agenda_remove_tags = true    -- Do not show tags only for this view
            },
          }
        }
      }
    })

    vim.lsp.enable('org')
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
      org_files = {
        '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/**/*',
        '~/Library/CloudStorage/GoogleDrive-mario.pozzo@mercadolibre.com/Otros ordenadores/Mi MacBook Pro/swat/orgfiles/*.org',
        --   "~/another_org_dir",
        --   "~/some/folder/*.org",
        --   "~/a/single/org_file.org"
      },
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
              template = '* TODO %?\n %u',
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
* %^{meet} %t                                      :meetings:
:PROPERTIES:
:ID: %(return require'orgmode.org.id'.new())
:DATE: %<%Y-%m-%d>
:START: %^{Start time|%<%Y-%m-%d %a %H:%M>}
:END:
- tags :: [[id:C19D5019-22F2-4447-866A-20015DAD7C25][#meetings]]
- participantes ::
** Notas
- %?

** Next Steps
        ]==],
              target = "%<%Y-%m-%d>.org",
              properties = { empty_lines = { before = 1 } },
            },
            s = {
              description = 'Meeting Lite',
              template = [==[
* %^{meet} %t                                      :meetings:
- %?
        ]==],
              target = "%<%Y-%m-%d>.org",
              properties = { empty_lines = { before = 1 } },
            },
            t = {
              description = 'Tactical',
              subtemplates = {
                i = {
                  description = 'Ivan',
                  template = [==[
* Tactical Ivan %t                                :tactical:Ivan:
:PROPERTIES:
:ID: %(return require'orgmode.org.id'.new())
:DATE: %<%Y-%m-%d>
:START: %^{Start time|%<%Y-%m-%d %a %H:%M>}
:END:
  - tags :: [[id:5262609C-3917-41B6-A334-DD25B5F91AF8][#tactical]] [[id:A0478756-8632-4441-A5A7-6DB36ACE7F02][Ivan Federico Ascierto]]

** %?
]==],
                  target = "daily/%<%Y-%m-%d>.org",
                  properties = { empty_lines = { before = 1 } },

                },
                g = {
                  description = 'Gera',
                  template = [==[
* Tactical Gera %t                                :tactical:Gera:
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
* Tactical Joaco %t                                :tactical:Joaco:
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
  superagenda,
}
