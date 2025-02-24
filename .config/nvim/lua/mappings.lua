require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Your new format mapping
map("n", "<leader>fm", function()
  require("conform").format({
    lsp_fallback = true,
    timeout_ms = 10000, -- also timeout 10 seconds because eslint otherwise fails
    async = false, -- synchronous because eslint otherwise fails
  })
end, { desc = "format file" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
