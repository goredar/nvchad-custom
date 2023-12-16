local autocmd = vim.api.nvim_create_autocmd
local vim = vim

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Show unprintable characters
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- Disable backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Auto reload on change
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
