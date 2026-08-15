local ui = require('plugins.ui')
local editor = require('plugins.editor')

-- helper function para concatenar los require
local function concat(...)
  local result = {}
  for _, t in ipairs({ ... }) do
    for _, v in ipairs(t) do result[#result + 1] = v end
  end
  return result
end

local plugins = {}

plugins = concat(editor, ui)

-- cycles the plugins table, install and setup the plugins
vim.pack.add(vim.tbl_map(function(p)
  return {
    src = (p.src:gsub("^gh:", "https://github.com/"):gsub("^cb:", "https://codeberg.org/")),
    version = p.version,
    name = p.name,
  }
end, plugins))

for _, p in ipairs(plugins) do
  _ = p.setup and p.setup()
end

vim.keymap.set("n", "<leader>pu", function() vim.pack.update() end,
  { desc = "Pack Update - code action to skip some" })

vim.keymap.set("n", "<leader>pr", function() vim.pack.update(nil, { target = "lockfile", force = true }) end,
  { desc = "vimpack to lockfile versions" })

vim.keymap.set("n", "<leader>pi", function() vim.pack.update(nil, { offline = true }) end, { desc = "vimpack info" })

