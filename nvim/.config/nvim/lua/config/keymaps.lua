
-- Spelling Suggestions: ]s and [s to jump to next spelling mistake. z= or <leader>ps to pick a suggestion.
vim.keymap.set("n", "<Leader>gs", "<CMD>setlocal spell!<CR>", { desc="Toggle Spelling Actions" })

vim.keymap.set("n", "<leader><leader>", "<cmd>e #<CR>", { desc = "Previous File" })

vim.keymap.set("n", "<leader>gd", "<CMD>lua vim.diagnostic.open_float()<CR>", { desc = "Show Diagnostics" })

vim.keymap.set("n", "[t", "<CMD>tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "]t", "<CMD>tabnext<CR>", { desc = "Next Tab" })

