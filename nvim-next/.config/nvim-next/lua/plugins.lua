local ui = require('plugins.ui')
local editor = require('plugins.editor')
local code = require('plugins.code')

local function map_keys(keymaps)
  for _, map in ipairs(keymaps) do
    local opts = { desc = map.desc }
    if map.silent ~= nil then
      opts.silent = map.silent
    end
    if map.noremap ~= nil then
      opts.noremap = map.noremap
    else
      opts.noremap = true
    end
    if map.expr ~= nil then
      opts.expr = map.expr
    end

    local mode = map.mode or "n"
    vim.keymap.set(mode, map[1], map[2], opts)
  end
end

-- helper function para concatenar los require
local function concat(...)
  local result = {}
  for _, t in ipairs({ ... }) do
    for _, v in ipairs(t) do result[#result + 1] = v end
  end
  return result
end

local plugins = {}

plugins = concat(editor, ui, code)

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
  _ = p.keys and map_keys(p.keys)
end


vim.keymap.set("n", "<leader>pu", function() vim.pack.update() end,
  { desc = "Pack Update - code action to skip some" })

vim.keymap.set("n", "<leader>pr", function() vim.pack.update(nil, { target = "lockfile", force = true }) end,
  { desc = "vimpack to lockfile versions" })

vim.keymap.set("n", "<leader>pi", function() vim.pack.update(nil, { offline = true }) end, { desc = "vimpack info" })
