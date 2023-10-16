local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
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
	"svelte",
	"rust_analyzer",
	"gopls",
  "vue-language-server",
}

lspconfig.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "blade" },
})

lspconfig.pyright.setup({
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.mod", ".git", "go.work"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

-- lspconfig.sonarlint.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	server = {
-- 		cmd = {
-- 			"sonarlint-language-server",
-- 			-- Ensure that sonarlint-language-server uses stdio channel
-- 			"-stdio",
-- 			"-analyzers",
-- 			-- paths to the analyzers you need, using those for python and java in this example
-- 			vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
-- 			vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
-- 			vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
-- 		},
-- 	},
-- 	filetypes = { "blade", "php" },
-- })

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
