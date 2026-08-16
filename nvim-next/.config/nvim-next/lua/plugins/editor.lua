local snacks = {
  src = "gh:folke/snacks.nvim",
  setup = function()
    local Snacks = require("snacks")

    Snacks.setup({
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          -- { section = "startup" },
        }
      },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      -- statuscolumn = { enabled = true, },
      words = { enabled = true },
    })

    vim.keymap.set('n', "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
  end,
  keys = {
    -- mas usados
    { "<leader><space>",  function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
    { "<leader>ff",       function() Snacks.picker.files() end,                 desc = "Find Files" },
    { "<leader>f<space>", function() Snacks.picker.buffers() end,               desc = "Find Buffers" },
    { "<leader>fd",       function() Snacks.picker.grep() end,                  desc = "Grep String" },
    { "<leader>fr",       function() Snacks.picker.resume() end,                desc = "Resume" },
    { "<leader>f:",       function() Snacks.picker.command_history() end,       desc = "Command History" },
    { "<leader>fn",       function() Snacks.picker.notifications() end,         desc = "Notification History" },
    { "<leader>fe",       function() Snacks.explorer() end,                     desc = "File Explorer" },
    -- git
    { "<leader>fgf",      function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
    { "<leader>fgb",      function() Snacks.picker.git_branches() end,          desc = "Git Branches" },
    { "<leader>fgl",      function() Snacks.picker.git_log() end,               desc = "Git Log" },
    { "<leader>fgL",      function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
    { "<leader>fgs",      function() Snacks.picker.git_status() end,            desc = "Git Status" },
    { "<leader>fgS",      function() Snacks.picker.git_stash() end,             desc = "Git Stash" },
    { "<leader>fgd",      function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
    -- Grep
    { "<leader>fl",       function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
    { "<leader>fB",       function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
    { "<leader>fw",       function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>fs"',      function() Snacks.picker.registers() end,             desc = "Registers" },
    { '<leader>fs/',      function() Snacks.picker.search_history() end,        desc = "Search History" },
    { "<leader>fsa",      function() Snacks.picker.autocmds() end,              desc = "Autocmds" },
    { "<leader>fsb",      function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
    { "<leader>fsc",      function() Snacks.picker.command_history() end,       desc = "Command History" },
    { "<leader>fsC",      function() Snacks.picker.commands() end,              desc = "Commands" },
    { "<leader>fsd",      function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
    { "<leader>fsD",      function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
    { "<leader>fsh",      function() Snacks.picker.help() end,                  desc = "Help Pages" },
    { "<leader>fsH",      function() Snacks.picker.highlights() end,            desc = "Highlights" },
    { "<leader>fsi",      function() Snacks.picker.icons() end,                 desc = "Icons" },
    { "<leader>fsj",      function() Snacks.picker.jumps() end,                 desc = "Jumps" },
    { "<leader>fsk",      function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
    { "<leader>fsl",      function() Snacks.picker.loclist() end,               desc = "Location List" },
    { "<leader>fsm",      function() Snacks.picker.marks() end,                 desc = "Marks" },
    { "<leader>fsM",      function() Snacks.picker.man() end,                   desc = "Man Pages" },
    { "<leader>fsq",      function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
    { "<leader>fsR",      function() Snacks.picker.resume() end,                desc = "Resume" },
    { "<leader>fsu",      function() Snacks.picker.undo() end,                  desc = "Undo History" },
    { "<leader>fuC",      function() Snacks.picker.colorschemes() end,          desc = "Colorschemes" },
    -- LSP
    { "gd",               function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
    { "gD",               function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
    { "gr",               function() Snacks.picker.lsp_references() end,        nowait = true,                     desc = "References" },
    { "gI",               function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
    { "gy",               function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
    { "gai",              function() Snacks.picker.lsp_incoming_calls() end,    desc = "C[a]lls Incoming" },
    { "gao",              function() Snacks.picker.lsp_outgoing_calls() end,    desc = "C[a]lls Outgoing" },
    { "<leader>ss",       function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
    { "<leader>sS",       function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { "<leader>n",        function() Snacks.notifier.show_history() end,        desc = "Notification History" },
    { "<leader>bd",       function() Snacks.bufdelete() end,                    desc = "Delete Buffer" },
    { "<leader>cR",       function() Snacks.rename.rename_file() end,           desc = "Rename File" },
    { "<leader>gB",       function() Snacks.gitbrowse() end,                    desc = "Git Browse",               mode = { "n", "v" } },
    { "<leader>un",       function() Snacks.notifier.hide() end,                desc = "Dismiss All Notifications" },
    { "<c-/>",            function() Snacks.terminal() end,                     desc = "Toggle Terminal" },
    { "<c-_>",            function() Snacks.terminal() end,                     desc = "which_key_ignore" },
    { "]]",               function() Snacks.words.jump(vim.v.count1) end,       desc = "Next Reference",           mode = { "n", "t" } },
    { "[[",               function() Snacks.words.jump(-vim.v.count1) end,      desc = "Prev Reference",           mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  }
}


local oil = {
  src = 'gh:stevearc/oil.nvim',
  setup = function()
    local detail = false
    require('oil').setup({
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    })

    vim.keymap.set('n', "-", "<CMD>Oil --float --preview<CR>", { desc = "Open parent directory" })
    vim.keymap.set('n', "<F3>", "<CMD>Oil --float --preview<CR>", { desc = "Open parent directory" })
  end
}
local which_key = {
  src = "gh:folke/which-key.nvim",
  setup = function()
    require("which-key").setup({
      preset = "modern"
    })

    vim.keymap.set('n', "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      { desc = "Buffer Local Keymaps (which-key)" }
    )
  end
}

local live_server = {
  -- dependencia de markdown_preview
  src = "gh:selimacerbas/live-server.nvim"
}

local markdown_preview = {
  src = "gh:selimacerbas/markdown-preview.nvim",
  setup = function()
    require("markdown_preview").setup({
      -- all optional; sane defaults shown
      instance_mode = "takeover", -- "takeover" (one tab) or "multi" (tab per instance)
      port = 0,                   -- 0 = auto (8421 for takeover, OS-assigned for multi)
      open_browser = true,
      debounce_ms = 300,
    })
    vim.keymap.set("n", "<leader>mps", "<cmd>MarkdownPreview<cr>", { desc = "Markdown: Start preview" })
    vim.keymap.set("n", "<leader>mpS", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown: Stop preview" })
    vim.keymap.set("n", "<leader>mpr", "<cmd>MarkdownPreviewRefresh<cr>", { desc = "Markdown: Refresh preview" })
  end
}

local md_touchup = {
  src = "gh:noisesfromspace/touchup.nvim",
  setup = function()
    require('touchup').setup()
  end
}

return {
  oil,
  which_key,
  live_server,
  markdown_preview,
  md_touchup,
  snacks,
}
