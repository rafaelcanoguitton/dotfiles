local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    sh = { "shfmt" },
    cpp = { "clang-format" },
    python = { "autopep8" },
    php = { "phpcsfixer" },
    blade = { "blade-formatter " },
    rust = { "rustfmt" },
    go = { "gofumpt", "goimports-reviser" },
    typescript = { "prettierd", "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
