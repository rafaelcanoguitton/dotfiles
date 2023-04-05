local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "jsonls",
  "tsserver",
  "tailwindcss",
  "bashls",
  "marksman",
  "intelephense",
  "pyright",
  "pylsp",
  "emmet_ls",
}


lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" , "blade" }
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
