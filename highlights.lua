-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  PmenuSel = { bg = { "pink", 2 }, bold = true },
  TelescopeMatching = { fg = "vibrant_green" },
  TelescopeSelection = { fg = { "pink", 1 } },
}

---@type HLTable
M.add = {
  --   NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
