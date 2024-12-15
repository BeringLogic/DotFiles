
-- Spelling Suggestions: ]s and [s to jump to next spelling mistake. z= or <leader>fs to pick a suggestion.
vim.keymap.set("n", "<Leader>gs", "<CMD>setlocal spell!<CR>", { desc="Toggle Spelling Actions" })

vim.keymap.set("n", "<leader><leader>", "<cmd>e #<CR>", { desc = "Previous File" })

