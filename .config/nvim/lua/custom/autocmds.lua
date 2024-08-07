vim.opt.relativenumber = true
-- vim.g.editorconfig = false
vim.g.editorconfig = true
vim.opt.smartindent = true
-- use 4 as tabsize
vim.opt.tabstop = 4
if vim.fn.has("macunix") ~= 1 then
  vim.opt.shell = "/usr/bin/fish"
end
-- if os.execute("which figterm") == 0 then
--   vim.opt.shell = "fish -c 'figterm'"
-- end
vim.g.copilot_assume_mapped = true -- necessary for copilot to work
if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

-- Toggle word wrap
vim.api.nvim_set_keymap('n', '<Leader>k', ':set wrap!<CR>', { noremap = true, silent = true })
--lazygit use <leader> plus gg
vim.api.nvim_set_keymap('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
vim.filetype.add({
  extension = {
    mdx = 'mdx'
  }
})
