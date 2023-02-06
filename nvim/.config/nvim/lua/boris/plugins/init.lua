local M = {
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "almo7aya/openingh.nvim",
    cmd = {
      "OpenInGHRepo",
      "OpenInGHFile"
    }
  },
  {
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
      require('Comment').setup()
    end
  }
}

return M
