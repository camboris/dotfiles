cfg = {
  bind = true,
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none
  },
} -- add you config here
require "lsp_signature".setup(cfg)
