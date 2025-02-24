-- local options = {
--   formatters_by_ft = {
--     lua = { "stylua" },
--     -- css = { { "prettier", configFile = true } },
--     -- html = { { "prettier", configFile = true } },
--     css = { "prettierd" },
--     html = { "prettierd" },
--     sh = { "shfmt" },
--     cpp = { "clang-format" },
--     python = { "autopep8" },
--     php = { "phpcsfixer" },
--     blade = { "blade-formatter" },
--     rust = { "rustfmt" },
--     go = { "gofumpt", "goimports-reviser" },
--     -- typescript = {
--     --   { "prettier", configFile = true },
--     --   { "eslint_d", configFile = true },
--     --   "prettierd",
--     -- },
--     typescript = { "prettierd", "eslint_d" },
--     -- javascript = {
--     --   { "prettier", configFile = true },
--     --   { "eslint_d", configFile = true },
--     -- },
--     javascript = { "prettierd", "eslint_d" },
--     typescriptreact = { "prettierd", "eslint_d" },
--     javascriptreact = { "prettierd", "eslint_d" },
--   },
--   -- format_on_save = {
--   --   -- These options will be passed to conform.format()
--   -- timeout_ms = 10000,
--   lsp_fallback = false,
--   -- },
--   formatters = {
--     prettierd = { "prettierd", configFile = true },
--   }
-- }
-- return options

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    sh = { "shfmt" },
    cpp = { "clang-format" },
    -- python = { "autopep8" },
    python = { "isort", "black" },
    php = { "phpcsfixer" },
    blade = { "blade-formatter" },
    rust = { "rustfmt" },
    go = { "gofumpt", "goimports-reviser" },
    typescript = { "prettierd", "eslint_d" },
    javascript = { "prettierd", "eslint_d" },
    typescriptreact = { "prettierd", "eslint_d" },
    javascriptreact = { "prettierd", "eslint_d" },
  },
  format_on_save = {
    timeout_ms = 10000,
    -- stop_after_first = true, -- This makes it stop after prettierd and not run eslint_d
  },
  lsp_fallback = false,
}
return options
