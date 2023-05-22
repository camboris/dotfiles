local map = vim.keymap.set
local default_options = { silent = true }

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = "/"

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
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')


-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- terminal
map('n', '<leader>tt', '<cmd>terminal<CR>')

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Easier file save
-- map("n", "<Leader>w", "<cd>:w<CR>")
map('n', '<C-s>', '<cmd>silent w<CR>', { silent = true })
map('i', '<C-s>', '<ESC>:silent w<CR>')

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

map('n', '<leader>tq', '<cmd>lua require("functions").toggle_qf()<CR>', default_options)


-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })


-- clear highlight search
map("n", "<leader>cs", "<cmd>noh<cr>", { silent = true, desc = "Clear Search highlight" })
