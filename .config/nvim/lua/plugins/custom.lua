return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
        "rust",
        "go",
        "vue",
      },
      -- autotag = {
      --   enable = true,
      -- },
      additional_vim_regex_highlighting = true,
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
      enable = true,
      enable_autocmd = false,
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    -- config = function()
    -- 	require("ts_context_commentstring").setup({})
    -- end,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/playground",
    config = function()
      require("nvim-treesitter.configs").setup {
        playground = {
          enable = true,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
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

        --rust stuff
        "rust-analyzer",
        "rustfmt",

        --go stuff
        "gopls",
        "goimports-reviser",
        "gofumpt",

        -- vue stuff
        "vetur-vls",
        -- "vls", this was for the v programming language lmao
      },
    },
  },

  -- Custom plugins
  {
    "andweeb/presence.nvim",
    lazy = false,
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

  -- {
  --   "github/copilot.vim",
  --   branch = "release",
  --   event = "BufReadPre"
  -- },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        -- copilot_node_command = "node", -- Node.js version must be > 16.x1
        server_opts_overrides = {},
      }
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    run = "cd app && yarn install",
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  -- ["neoclide/coc.nvim"] = { branch = "release" },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
    keys = {
      {
        "<leader>qs",
        function()
          return require("persistence").load()
        end,
        desc = "Restore the session for the current dir",
      },
      {
        "<leader>ql",
        function()
          return require("persistence").load { last = true }
        end,
        desc = "Restore the last session",
      },
      {
        "<leader>qd",
        function()
          return require("persistence").stop()
        end,
        desc = "Stop persistence",
      },
    },
  },

  {
    "jwalton512/vim-blade",
    ft = { "blade" },
  },

  {
    "prisma/vim-prisma",
    ft = { "prisma" },
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    event = "BufReadPre",
  },
  {
    "junegunn/gv.vim",
    event = "BufReadPre",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      on_attach = function(bufnr)
        -- utils.load_mappings("gitsigns", { buffer = bufnr })
      end,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig" },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "lazygit"
    end,
  },
  {
    "kylechui/nvim-surround",
    config = true,
    keys = {
      { "cs", mode = "n", desc = "Change surroundings" },
      { "ys", mode = "n", desc = "Add surroundings" },
      { "ds", mode = "n", desc = "Delete surroundings" },
    },
  },

  { "mbbill/undotree", keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Open undo tree" } } },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      -- require("core.utils").load_mappings "comment"
    end,
    config = function(_)
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup {
        auto_display = true,
      }
    end,
  },
  -- custom cmp config
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require "nvchad.configs.cmp"
      local cmp = require "cmp"

      opts.completion = {
        completeopt = "menu,menuone,noselect,noinsert",
      }

      opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }

      return opts
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").create_default_mappings()
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("oil").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = { use_diagnostic_signs = true },
    keys = {
      {
        "<leader>xx",
        function()
          return require("trouble").toggle()
        end,
        desc = "Toggle trouble.nvim",
      },
      {
        "<leader>xw",
        function()
          return require("trouble").toggle "workspace_diagnostics"
        end,
        desc = "Open workspace diagnostics",
      },
      {
        "<leader>xd",
        function()
          return require("trouble").toggle "document_diagnostics"
        end,
        desc = "Open document diagnostics",
      },
      {
        "<leader>xq",
        function()
          return require("trouble").toggle "quickfix"
        end,
        desc = "Open quickfix",
      },
      {
        "<leader>xl",
        function()
          return require("trouble").toggle "loclist"
        end,
        desc = "Open location list",
      },
      {
        "gR",
        function()
          return require("trouble").toggle "lsp_references"
        end,
        desc = "References",
      },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprevious)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Next trouble/quickfix item",
      },
      { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme (Trouble)" },
    },
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- providers = { 'lsp', 'treesitter', 'regex' },
      large_file_cuttoff = 2000,
      large_file_overrides = { providers = { "lsp" } },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end
      map("]]", "next")
      map("[[", "prev")
      -- Set it after loading ftplugins
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = { { "]]", desc = "Next Reference" }, { "[[", desc = "Prev Reference" } },
  },
  {
    "tzachar/highlight-undo.nvim",
    keys = { "u", "<C-r>" },
    config = true,
  },
  {
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Open undo tree" } },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_ShortIndicators = 1
    end,
  },
  { "fladson/vim-kitty", ft = "kitty" },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<C-a>",
        function()
          return require("dial.map").inc_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_normal()
        end,
        expr = true,
        desc = "Decrement",
      },
      {
        "g<C-a>",
        function()
          return require("dial.map").inc_gnormal()
        end,
        expr = true,
        desc = "Multiline increment",
      },
      {
        "g<C-x>",
        function()
          return require("dial.map").dec_gnormal()
        end,
        expr = true,
        desc = "Multiline decrement",
      },
      {
        "<C-a>",
        function()
          return require("dial.map").inc_visual()
        end,
        mode = "v",
        expr = true,
        desc = "Increment",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_visual()
        end,
        mode = "v",
        expr = true,
        desc = "Decrement",
      },
      {
        "g<C-a>",
        function()
          return require("dial.map").inc_gvisual()
        end,
        mode = "v",
        expr = true,
        desc = "Multiline increment",
      },
      {
        "g<C-x>",
        function()
          return require("dial.map").dec_gvisual()
        end,
        mode = "v",
        expr = true,
        desc = "Multiline decrement",
      },
    },
    config = function()
      local augend = require "dial.augend"
      require("dial.config").augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.integer.alias.octal,
          augend.integer.alias.binary,
          augend.constant.alias.bool,
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
          augend.constant.new { elements = { "and", "or" }, word = true, cyclic = true },
          augend.constant.new { elements = { "&&", "||" }, word = false, cyclic = true },
          augend.constant.new {
            elements = {
              "Monday",
              "Tuesday",
              "Wednesday",
              "Thursday",
              "Friday",
              "Saturday",
              "Sunday",
            },
            word = true,
            cyclic = true,
          },
          augend.constant.new {
            elements = {
              "January",
              "February",
              "March",
              "April",
              "May",
              "June",
              "July",
              "August",
              "September",
              "October",
              "November",
              "December",
            },
            word = true,
            cyclic = true,
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    opts = { max_lines = 3 },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│", tab_char = "│" },
      scope = { enabled = false },
      exclude = { filetypes = { "lazy", "dashboard", "mason" } },
    },
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "andymass/vim-matchup",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
      vim.g.matchup_matchparen_deferred = 1
    end,
  },
  {
    "Wansmer/treesj",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = { max_join_length = 150 },
    keys = {
      {
        "<leader>m",
        function()
          return require("treesj").toggle()
        end,
        desc = "Toggle node under cursor",
      },
      {
        "<leader>j",
        function()
          return require("treesj").join()
        end,
        desc = "Join node under cursor",
      },
      {
        "<leader>s",
        function()
          return require("treesj").split()
        end,
        desc = "Split node under cursor",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    -- we'll run the setup here and only open for markdown files
    config = function()
      require("render_markdown").setup {
        filetypes = { "markdown" },
      }
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
}
