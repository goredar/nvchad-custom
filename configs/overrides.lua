local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "go",
    "gomod",
    "gosum",
    "hcl",
    "terraform",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- Python
    "pyright",

    -- Goalng
    "gopls",

    -- Rust
    "rustfmt",
    "rust-analyzer",

    -- JSON/YAML
    "json-lsp",
    "yaml-language-server",

    -- Terraform
    "terraform-ls",
    "tflint",
    "tfsec",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  show_trailing_blankline_indent = true,
}

return M
