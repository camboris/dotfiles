-- for repository page
vim.api.nvim_set_keymap("n", "<Leader>gh", ":OpenInGHRepo <CR>", { silent = true, noremap = true })

-- for current file page
vim.api.nvim_set_keymap("n", "<Leader>gf", ":OpenInGHFile <CR>", { silent = true, noremap = true })
