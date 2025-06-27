require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "emmet_language_server", "ts_ls"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
local pid = vim.fn.getpid()
lspconfig.omnisharp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilites = nvlsp.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  cmd = {"dotnet", "/usr/lib/omnisharp/OmniSharp.dll"}
}
