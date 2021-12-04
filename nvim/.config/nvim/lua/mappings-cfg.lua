local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- MAPPINGS ------------------------------
-- tab
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
-- esc
map('i', 'jj', '<ESC>')
map('t', 'jj', '<ESC>', {noremap = false})
map('t', '<ESC>', '<C-\\><C-n>')

-- tabs
map('n', '<C-w>T', '<cmd>tabclose<CR>')
map('n', '<C-w>t', '<cmd>tabnew<CR>')
map('n', '<C-S-Right>', '<cmd>tabn<CR>')
map('i', '<C-S-Right>', '<ESC><cmd>tabn<CR>')
map('n', '<C-S-Left>', '<cmd>tabp<CR>')
map('i', '<C-S-Left>', '<ESC><cmd>tabp<CR>')

-- windows
map('n', '<S-Down>', '<C-w>2-')
map('n', '<S-Left>', '<C-w>2<')
map('n', '<S-Right>', '<C-w>2>')
map('n', '<S-Up>', '<C-w>2+')
--
-- Better window navigation
map ('n', '<C-h>', '<C-w>h')
map ('n', '<C-j>', '<C-w>j')
map ('n', '<C-k>', '<C-w>k')
map ('n', '<C-l>', '<C-w>l')
--
-- terminal
map('n', '<leader>tt', '<cmd>terminal<CR>')
-- 
-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Easier file save
map("n", "<Leader>w", "<cmd>:w<CR>")
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<ESC>:w<CR>')
