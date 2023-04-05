local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.autopep8,

  --php
  b.formatting.phpcbf,
  b.formatting.phpcsfixer,
  b.formatting.blade_formatter,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

