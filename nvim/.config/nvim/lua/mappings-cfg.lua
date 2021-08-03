local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- MAPPINGS ------------------------------
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', 'jj', '<ESC>')
map('t', 'jj', '<ESC>', {noremap = false})
map('t', '<ESC>', '<C-\\><C-n>')
map('n', '<C-w>T', '<cmd>tabclose<CR>')
map('n', '<C-w>t', '<cmd>tabnew<CR>')
map('n', '<C-S-Right>', '<cmd>tabn<CR>')
map('i', '<C-S-Right>', '<ESC><cmd>tabn<CR>')
map('n', '<C-S-Left>', '<cmd>tabp<CR>')
map('i', '<C-S-Left>', '<ESC><cmd>tabp<CR>')
map('n', '<F3>', '<cmd>lua toggle_wrap()<CR>')
map('n', '<S-Down>', '<C-w>2<')
map('n', '<S-Left>', '<C-w>2-')
map('n', '<S-Right>', '<C-w>2+')
map('n', '<S-Up>', '<C-w>2>')
map('n', '<leader>t', '<cmd>terminal<CR>')


function toggle_wrap()
  wo.breakindent = not wo.breakindent
  wo.linebreak = not wo.linebreak
  wo.wrap = not wo.wrap
end
