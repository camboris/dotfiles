require("options")
require("mappings")
require("autocmd")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "boris.plugins", cond = (function() return not vim.g.vscode end) },
	-- { import = "user.plugins_always",    cond = true },
	-- { import = "user.plugins_vscode",    cond = (function() return vim.g.vscode end) },
})
