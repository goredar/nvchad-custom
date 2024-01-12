local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local signs = {
  { name = "DiagnosticSignError", text = "●" },
  { name = "DiagnosticSignWarn", text = "●" },
  { name = "DiagnosticSignHint", text = "●" },
  { name = "DiagnosticSignInfo", text = "●" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = false,
  signs = { active = signs },
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  numhl = {},
  linehl = {},
}

vim.diagnostic.config(config)

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "lua_ls",
  "pyright",
  "gopls",
  "bashls",
  "terraformls",
  "sqlls",
  "dockerls",
  "docker_compose_language_service",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = {
        enable = true,
      },
    },
  },
}

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
