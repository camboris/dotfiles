local headlines = {
  "lukas-reineke/headlines.nvim",
  ft = "org",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true, -- or `opts = {}`
}

local orgmode = {
  'nvim-orgmode/orgmode',
  -- event = 'VeryLazy',
  ft = "org",
  config = function()
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })
  end,
}

local roam = {
  "chipsenkbeil/org-roam.nvim",
  ft = "org",
  tag = "0.2.0",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.7.0",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/org_roam_files",
      -- optional
      -- org_files = {
      --   "~/another_org_dir",
      --   "~/some/folder/*.org",
      --   "~/a/single/org_file.org",
      -- }
    })
  end
}

return {
  orgmode,
  roam,
  headlines,
}

