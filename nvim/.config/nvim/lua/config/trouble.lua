require("trouble").setup { }

local wk = require("which-key")
default_options = { silent = true }

wk.register({
	x = {
		name = "Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Trouble Toggle"},
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics"},
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics"},
    l = { "<cmd>TroubleToggle loclist<cr>", "Location list"},
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quick Fix"},
    r = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references"},
	},
}, { prefix = "<leader>", mode = "n", default_options })
