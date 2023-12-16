local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "plugins.configs.telescope"
      local actions = require "telescope.actions"

      conf.defaults.mappings.i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<Esc>"] = actions.close,
      }

      conf.defaults.file_ignore_patterns = { ".git/", "node_modules/" }
      conf.pickers = {
        find_files = {
          hidden = true,
        },
      }

      return conf
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  --
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  --
  {
    "hrsh7th/nvim-cmp",
    dependencies = {},
    opts = function()
      local opts = require "plugins.configs.cmp"

      opts.mapping["<C-f>"] = opts.mapping["<CR>"]
      opts.mapping["<C-j>"] = opts.mapping["<Tab>"]
      opts.mapping["<C-k>"] = opts.mapping["<S-Tab>"]

      opts.sources = {
        { name = "nvim_lsp" },
        { name = "codeium" },
        { name = "luasnip" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = "nvim_lua" },
        { name = "path" },
      }

      return opts
    end,
  },

  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "b0o/schemastore.nvim",
  },

  {
    "farmergreg/vim-lastplace",
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
  },

  {
    "ggandor/leap.nvim",
    dependencies = {
      {
        "tpope/vim-repeat",
        lazy = false,
      },
    },
    config = function()
      require("leap").add_default_mappings()
    end,
    lazy = false,
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-X>]],
        -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
        direction = "tab",
      }
    end,
    lazy = false,
  },

  -- Disabled
  { "NvChad/nvterm", enabled = false },
  { "NvChad/nvim-colorizer.lua", enabled = false },
}

return plugins
