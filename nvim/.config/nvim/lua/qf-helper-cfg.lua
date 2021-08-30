local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
--
-- Set up qf_helper with the default config
require'qf_helper'.setup()

-- " use <C-N> and <C-P> for next/prev.
map('n', '<C-N>', '<cmd>QNext<CR>', { silent = true})
map('n', '<C-P>', '<cmd>QPrev<CR>', { silent = true})
-- " toggle the quickfix open/closed without jumping to it
map('n', '<leader>q', '<cmd>QFToggle<CR>', { silent = true})
map('n', '<leader>l', '<cmd>LLToggle<CR>', { silent = true})

