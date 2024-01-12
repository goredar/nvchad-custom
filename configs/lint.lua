local lint = require "lint"

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  svelte = { "eslint_d" },

  markdown = { "vale", "markdownlint" },

  python = { "pylint", "flake8", "ruff", "bandit" },
  go = { "staticcheck", "golangcilint", "revive" },

  terraform = { "tflint", "tfsec" },
  hcl = {},

  dockerfile = { "hadolint" },

  ["*"] = { "codespell", "write_good" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
