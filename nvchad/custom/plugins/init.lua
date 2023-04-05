local overrides = require "custom.plugins.overrides"

return {

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  -- override default configs
  ["nvim-treesitter/nvim-treesitter"] = { override_options = overrides.treesitter },
  ["nvim-treesitter/playground"] = {
    config = function()
      require("nvim-treesitter.configs").setup {
        playground = {
          enable = true,
        },
      }
    end,
  },
  ["williamboman/mason.nvim"] = { override_options = overrides.mason },

  -- TODO:
  -- format & linting i need to revisit this 
  --   ["jose-elias-alvarez/null-ls.nvim"] = {
  --     after = "nvim-lspconfig",
  --     config = function()
  --       require "custom.plugins.null-ls"
  --     end,
  --   },

  -- Custom plugins
  ["andweeb/presence.nvim"] = {
    auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text = "The One True Text Editor",
    log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number = false, -- Displays the current line number instead of the current project
    blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time = true, -- Show the timer

    -- Rich Presence text options
    editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text = "Line %s out of %s",
    main_image = "neovim",
  },

  ["github/copilot.vim"] = {
    branch = "release",
  },
  -- Apparrently NVchad config already includes this plugin
  -- and a much more complicated setup so I'll just use that
  -- TODO: Remove commented code
  --  ["lewis6991/gitsigns.nvim"] = {
  --   config = function()
  --      require 'gitsigns'.setup{
  --        current_line_blame = true,
  --        current_line_blame_opts = {
  --          delay = 0,
  --        },
  --      }
  --    end,
  --  },
  ["iamcco/markdown-preview.nvim"] = {
    ft = { "markdown" },
    run = "cd app && yarn install",
  },
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },
}

--this doesn't work it seems im dumb af
-- -- enabling and managing plug plugins

-- local Plug = vim.fn["plug#"]
-- vim.call('plug#begin', '~/.config/nvim/plugged')
-- Plug 'jwalton512/vim-blade'
-- vim.call('plug#end')
