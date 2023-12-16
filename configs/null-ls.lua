local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- Diagnostics
  b.diagnostics.actionlint,
  b.diagnostics.codespell,
  b.diagnostics.commitlint,
  b.diagnostics.gitlint,
  b.diagnostics.hadolint,
  b.diagnostics.shellcheck,
  b.diagnostics.write_good,
  b.diagnostics.jsonlint,
  b.diagnostics.yamllint,
  b.diagnostics.vale,
  b.diagnostics.sqlfluff.with {
    extra_args = { "--dialect", "postgres" },
  },

  b.formatting.trim_newlines.with {
    disabled_filetypes = { "yaml", "json" },
  },
  b.formatting.trim_whitespace.with {
    disabled_filetypes = { "yaml", "json" },
  },

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier.with {
    disabled_filetypes = { "yaml", "json" },
  },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Python
  b.diagnostics.flake8,
  b.diagnostics.ruff,
  b.formatting.isort,
  b.formatting.black,

  -- Golang
  b.diagnostics.golangci_lint,
  b.formatting.gofumpt,
  b.formatting.goimports.with {
    extra_args = { "-local", "gitlab.pandadoc.com" },
  },
  -- b.formatting.golines,

  -- Terraform
  b.diagnostics.terraform_validate,
  b.diagnostics.tfsec,
  b.formatting.hclfmt,
  b.formatting.terraform_fmt,

  -- Other
  b.formatting.markdownlint,
  -- b.formatting.sqlfluff.with({
  --   extra_args = { "--dialect", "postgres" },
  -- }),
}

-- Autoformatting on save
null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
