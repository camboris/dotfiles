-- local g = vim.g
local cmd = vim.cmd

-- Available values: `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'`
-- g.sonokai_style = 'shusia'
local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup(
{
	transparent_background = false,
	term_colors = false,
	styles = {
		comments = "italic",
		functions = "italic",
		keywords = "italic",
		strings = "NONE",
		variables = "NONE",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_trouble = false,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = false,
			show_root = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = false,
			colored_indent_levels = false,
		},
		dashboard = false,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = false,
		markdown = false,
		lightspeed = false,
		ts_rainbow = false,
		hop = false,
	},
}
)

cmd 'colorscheme catppuccin'

