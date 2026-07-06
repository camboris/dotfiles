vim.api.nvim_create_user_command('AddBullet', function(opts)
  local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
  for i, line in ipairs(lines) do
    lines[i] = '- ' .. line
  end
  vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, lines)
end, { range = true })

vim.keymap.set('n', '<leader>ofl', ':AddBullet<CR>', { desc = 'Add bullet point to line' })
vim.keymap.set('v', '<leader>ofl', ":'<,'>AddBullet<CR>", { desc = 'Add bullet point to selection' })
