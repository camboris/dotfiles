vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_picker_input",
  callback = function()
    vim.b.completion = false -- Disables native completion for the buffer
    vim.o.autocomplete = false
  end,
})
