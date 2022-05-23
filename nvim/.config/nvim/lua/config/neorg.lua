require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.integrations.nvim-cmp"] = {},
		["core.norg.concealer"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {},
		["core.norg.qol.toc"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					personal = "~/desarrollo/personal/notas", -- Format: <name_of_workspace> = <path_to_workspace_root>
					swat = "~/desarrollo/swatstuff",
				},
				autochdir = true, -- Automatically change the directory to the current workspace's root every time
				index = "index.norg", -- The name of the main (root) .norg file
			},
		},
	},
})
