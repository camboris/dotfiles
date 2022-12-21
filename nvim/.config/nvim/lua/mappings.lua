local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- paste over currently selected text without yanking it
map("v", "p", '"_dP', default_options)

-- esc alternaties
map('i', 'jj', '<ESC>')
map('i', 'jk', '<ESC>')

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

-- terminal
map('n', '<leader>tt', '<cmd>terminal<CR>')

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Easier file save
map("n", "<Leader>w", "<cmd>:w<CR>")
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<ESC>:w<CR>')

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

map('n', '<leader>tq', '<cmd>lua require("functions").toggle_qf()<CR>', default_options)
