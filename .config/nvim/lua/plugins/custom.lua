return {
  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
    dependencies = {
      {
        "giuxtaposition/blink-cmp-copilot",
      },
    },
    opts = {
      completion = { list = { selection = { preselect = false, auto_insert = false } } },
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
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
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
      require("nvim-ts-autotag").setup()
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions_list = { "fzf", "terms", "nerdy", "media" },

      extensions = {
        media = {
          backend = "ueberzug",
        },
      },
    },

    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "2kabhishek/nerdy.nvim",
      "dharmx/telescope-media.nvim",
    },
    config = function()
      local telescope = require "telescope"
      telescope.setup {
        pickers = {
          live_grep = {
            file_ignore_patterns = { ".git", ".venv" },
            additional_args = function(_)
              return { "--hidden" }
            end,
          },
          find_files = {
            file_ignore_patterns = { "node_modules", ".git", ".venv" },
            hidden = true,
          },
        },
        extensions = {
          "fzf",
        },
      }
      telescope.load_extension "fzf"
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
        -- "pyright",
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
        -- eslint stuff
        "eslint_d",
        "eslint-lsp",
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
  --   event = "BufReadPre",
  -- },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    -- dependencies = {
    --   {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function()
    --       require("copilot_cmp").setup()
    --     end,
    --   },
    -- },
    config = function()
      require("copilot").setup {
        panel = {
          enabled = false,
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
          enabled = false,
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
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function()
  --     local opts = require "nvchad.configs.cmp"
  --     local cmp = require "cmp"
  --
  --     opts.completion = {
  --       completeopt = "menu,menuone,noselect,noinsert",
  --     }
  --
  --     opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
  --
  --     return opts
  --   end,
  -- },
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
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
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
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   opts = {},
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
  --   -- we'll run the setup here and only open for markdown files
  --   config = function()
  --     require("render-markdown").setup {
  --       filetypes = { "markdown" },
  --     }
  --   end,
  --   event = { "BufReadPost", "BufNewFile" },
  -- },
  {
    -- we'll always load this one
    "numToStr/prettierrc.nvim",
    event = { "BufReadPre" },
  },
  -- to use when copilot free tier quota gets surpassed
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("supermaven-nvim").setup {
  --       keymaps = {
  --         accept_suggestion = "<A-l>",
  --         clear_suggestion = "<C-]>",
  --         accept_word = "<C-j>",
  --       },
  --     }
  --   end,
  -- },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      cmdline = {
        view = "cmdline_popup",
        opts = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = 3,
          },
        },
      },
      routes = {
        {
          view = "notify", -- Use 'notify' for notifications
          filter = { event = "msg_showmode" }, -- Filter for showmode messages
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- configuration goes here
    },
  },
}
