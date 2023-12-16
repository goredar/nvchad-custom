---@type ChadrcConfig
local M = {}
local highlights = require "custom.highlights"

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
M.ui = {
  theme = "catppuccin",
  hl_override = highlights.override,
  hl_add = highlights.add,
}

return M
