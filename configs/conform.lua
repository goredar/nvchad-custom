local conform = require "conform"

local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    graphql = { "prettier" },

    python = { "isort", "black" },
    go = { "goimports", "golines", "gofumpt" },

    sh = { "shfmt", "shellcheck" },
    sql = { "pg_format", "sqlfluff" },

    markdown = { "deno_fmt", "prettier" },

    ["*"] = { "codespell", "trim_newlines", "trim_newlines" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
}

conform.formatters.sqlfluff = {
  args = { "fix", "--force", "--dialect=postgres", "-" },
}
conform.formatters.goimports = {
  prepend_args = { "-local", "gitlab.pandadoc.com" },
}

require("conform").setup(options)
