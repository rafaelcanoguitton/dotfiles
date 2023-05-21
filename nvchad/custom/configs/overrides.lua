-- overriding default plugin configs!
local utils = require "core.utils"

local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "c",
    "bash",
    "lua",
    "norg",
    "tsx",
    "typescript",
    "php",
    "python",
  },
  autotag = {
    enable = true,
  },
  additional_vim_regex_highlighting = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
}

M.nvimtree = {
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },

  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- M.blankline = {
--   filetype_exclude = {
--     "help",
--     "terminal",
--     "alpha",
--     "packer",
--     "lspinfo",
--     "TelescopePrompt",
--     "TelescopeResults",
--     "nvchad_cheatsheet",
--     "lsp-installer",
--     "norg",
--     "",
--   },
-- }

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "emmet-ls",
    "json-lsp",
    "tailwindcss-language-server",

    -- shell
    "shfmt",
    "shellcheck",
    "bash-language-server",
    -- php/laravel
    "intelephense",
    "php-cs-fixer",
    "phpcbf",
    "phpcs",
    "phpmd",
    "blade-formatter",
    -- python stuff
    "pyright",
    "autoflake",
    "autopep8",
    "black",
    "blackd-client",
    "blue",
    "debugpy",
    "python-lsp-server",

    --markdown stuff
    "markdownlint",
    "marksman",

    --general
    "prettier",
    "prettierd",
  },
}

M.gitsigns = {
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    untracked = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
  },
  on_attach = function(bufnr)
    utils.load_mappings("gitsigns", { buffer = bufnr })
  end,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
}


return M
