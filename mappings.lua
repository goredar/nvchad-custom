---@type MappingsTable
local M = {}
local vim = vim

M.general = {
  i = {
    ["<C-a>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },
  },

  n = {

    ["0"] = { "^" },
    ["^"] = { "0" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<Leader>z"] = { "1z=" },

    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files", "Telescope: find files" },
    ["<C-z>"] = { "<cmd> Telescope live_grep <CR>", "Live grep", "Telescope: live grep" },
    ["<S-i>"] = { "<cmd> Telescope git_bcommits <CR>", "git commits" },

    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["<C-q>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },

    ["<C-j>"] = {
      function()
        vim.diagnostic.goto_next()
      end,
    },
    ["<C-k>"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
    },

    ["gd"] = { "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>" },
    ["gi"] = { "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>" },
    ["gr"] = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>" },

    ["<leader>rn"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
  },
}

return M
