local opt = vim.opt
local g = vim.g

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- options
local indent, width = 2, 80

opt.backspace = { 'indent', 'eol', 'start' }
opt.clipboard='unnamedplus'              -- Copy paste between vim and everything else
-- opt.cmdheight=2
opt.colorcolumn = tostring(width)   -- Line length marker
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options
opt.conceallevel=0                      -- So that I can see `` in markdown files
opt.cursorline = true               -- Highlight cursor line
opt.encoding = 'utf-8'		 -- Set default encoding to UTF-8
opt.expandtab = true                -- Use spaces instead of tabs
opt.fileencoding = 'utf-8'                  -- The encoding written to file
opt.foldenable = false
opt.foldmethod = 'indent'
opt.formatoptions = 'crqnj'         -- Automatic formatting options
-- opt.formatoptions = 'l'
-- opt.formatoptions-=cro                  -- Stop newline continution of comments
opt.hidden = true                   -- Enable background buffers
opt.hlsearch = true -- Highlight found searches
opt.ignorecase = true               -- Ignore case
opt.inccommand = 'split' -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false              -- No double spaces with join
opt.laststatus=2                        -- Always display the status line
opt.linebreak = true -- Stop words being broken on wrap
opt.list = false 		-- Show some invisible characters
-- opt.list = true                     -- Show some invisible characters
opt.mouse = 'a'                             -- Enable your mouse
opt.number = true                   -- Show line numbers
opt.numberwidth = 2 -- Make the gutter wider by default
opt.pumheight = 12                  -- Max height of popup menu
opt.relativenumber = true           -- Relative line numbers
opt.ruler = true		-- Show the cursor position all the time
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = indent             -- Size of an indent
opt.shortmess = 'atToOFc'           -- Prompt message options
opt.showmode = false -- Don't display mode
opt.showtabline=2                       -- Always show tabs 
opt.sidescrolloff = 8               -- Columns of context
opt.signcolumn = 'yes'              -- Show sign column
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.smarttab = true                     -- Makes tabbing smarter will realize you have 2 vs 4
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = indent                -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.updatetime = 100                -- Delay before swap file is saved
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
-- opt.wrap = false
opt.wrap = true

