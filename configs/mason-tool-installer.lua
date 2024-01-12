local installer = require "mason-tool-installer"

installer.setup {
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "luacheck",
    "stylua",

    -- Webdev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp
    "clangd",
    "clang-format",

    -- Bash
    "bash-language-server",
    "shellcheck",
    "shfmt",

    -- Python
    "pyright",

    -- Goalng
    "gopls",
    "golangci-lint",
    "gofumpt",
    "golines",
    "gotests",
    "impl",
    "json-to-struct",
    "revive",
    "staticcheck",

    -- Rust
    "rustfmt",
    "rust-analyzer",

    -- JSON/YAML
    "json-lsp",
    "yaml-language-server",

    -- Terraform/HCL
    "terraform-ls",
    "tflint",
    "tfsec",

    -- SQL
    "sqlls",
    "sql-formatter",
    "sqlfluff",

    -- Other
    "codespell",
    "sonarlint-language-server",
    "editorconfig-checker",
    "misspell",
    "vale",
    "vale-ls",
    "write-good",
    "markdownlint",

    -- Docker
    "dockerls",
    "docker-compose-language-service",
    "hadolint",

    "bash-language-server",
    "lua-language-server",
    "vim-language-server",
    "gopls",
    "stylua",
    "sqlfmt",
    "editorconfig-checker",
    "gofumpt",
    "golines",
    "gotests",
    "goimports",
    "impl",
    "json-to-struct",
    "jq",
    "misspell",
    "revive",
    "staticcheck",
    "vint",
    "yamllint",
    "yamlfmt",
    "yamlls",
    "hadolint",
    "dockerls",
    "diagnosticls",
    "terraformls",
    "delve",
  },
  auto_update = true,
}
