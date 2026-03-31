require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "clangd",
  "emmet_language_server",
  "ts_ls",
  "gopls",
  "basedpyright",
  "luals"
}

local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  -- NEW API: Use vim.lsp.config to define the server
  vim.lsp.config(lsp, {
    capabilities = nvlsp.capabilities,
  })
  -- Then enable it
  vim.lsp.enable(lsp)
end
