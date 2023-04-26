vim.opt.relativenumber = true
vim.g.editorconfig = false
if vim.fn.has("macunix") ~= 1 then
  vim.opt.shell = "/usr/bin/fish"
end
if os.execute("which figterm") == 0 then
  vim.opt.shell = "fish -c 'figterm'"
end
-- vim.g.copilot_assume_mapped = true -- necessary for copilot to work
-- if vim.g.neovide == true then
--   vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
--   vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
--   vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
-- end
-- -- attempt for vim-plug
-- local Plug = vim.fn["plug#"]
-- vim.call('plug#begin', '~/.config/nvim/plugged')
-- Plug 'jwalton512/vim-blade'
-- Plug 'prisma/vim-prisma'
-- vim.call('plug#end')
-- identation
-- vim.opt.shiftwidth = 2
-- vim.opt.expandtab = false
-- vim.opt.softtabstop = 2
