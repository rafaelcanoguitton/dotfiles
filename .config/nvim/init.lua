vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- here we'll do autocmds bc i literally don't know how else to do it
vim.opt.relativenumber = true
vim.g.editorconfig = false
vim.opt.smartindent = true
if vim.fn.has "macunix" ~= 1 then
  vim.opt.shell = "/usr/bin/fish"
end
-- if os.execute("which figterm") == 0 then
--   vim.opt.shell = "fish -c 'figterm'"
-- end
vim.g.copilot_assume_mapped = true -- necessary for copilot to work
if vim.g.neovide == true then
  vim.api.nvim_set_keymap(
    "n",
    "<C-+>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-->",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

-- Toggle word wrap
vim.api.nvim_set_keymap("n", "<Leader>k", ":set wrap!<CR>", { noremap = true, silent = true })
--lazygit use <leader> plus gg
vim.api.nvim_set_keymap("n", "<Leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
