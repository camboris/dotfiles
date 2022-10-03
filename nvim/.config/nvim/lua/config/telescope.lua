local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_strategy = "flex",
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		buffers = {
			ignore_current_buffer = true,
			sort_lastused = true,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("notify")
-- mapping

-- local map = vim.keymap.set
-- map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
-- map("n", "<leader>sc", "<cmd>Telescope command<cr>", { noremap = true, silent = true })
-- map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = true })
-- map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
-- map("n", "<leader>st", "<cmd>Telescope tags<cr>", { noremap = true, silent = true })
-- map("n", "<leader>sd", "<cmd>Telescope grep_string<cr>", { noremap = true, silent = true })
-- map("n", "<leader>sp", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
-- map("n", "<leader>so", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true })
-- map("n", "<F4>", "<cmd>Telescope file_browser<cr>", { noremap = true, silent = true })
-- map("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

local wk = require("which-key")
default_options = { silent = true }

wk.register({
	s = {
		name = "Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Find Files"},
    c = { "<cmd>Telescope commands<cr>", "Commands"},
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer Fuzzy"},
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags"},
    d = { "<cmd>Telescope grep_string<cr>", "Grep String"},
    p = { "<cmd>Telescope live_grep<cr>", "Live Grep"},
    o = { "<cmd>Telescope oldfiles<cr>", "Oldfiles"},
    t = { "<cmd>Telescope file_browser<cr>", "File Browser"},
    ["<space>"] = { "<cmd>Telescope buffers<cr>", "Buffers"},
	},
}, { prefix = "<leader>", mode = "n", default_options })
