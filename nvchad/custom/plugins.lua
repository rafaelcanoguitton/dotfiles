local overrides = require("custom.configs.overrides")

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				-- format & linting
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	-- {
	--     "goolord/alpha-nvim",
	--     disable = false
	-- },
	-- format & linting
	-- override default configs
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		-- config = function()
		-- 	require("ts_context_commentstring").setup({})
		-- end,
	},
	{
		"nvim-treesitter/playground",
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
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
			require("copilot").setup({
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
					yaml = false,
					markdown = false,
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
			})
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
			require("todo-comments").setup({})
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
					return require("persistence").load({ last = true })
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
		opts = overrides.gitsigns,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig" },
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("lazygit")
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
			require("core.utils").load_mappings("comment")
		end,
		config = function(_)
			require("Comment").setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
		end,
	},
}
