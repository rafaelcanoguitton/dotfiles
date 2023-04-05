-- First read our docs (completely) then check the example_config repo

local M = {}

M.plugins = require "custom.plugins"

M.ui = {
  theme = "decay",
  dashboard = true,
  smartindent = false,
}

return M
