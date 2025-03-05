
-- Spelling Suggestions: ]s and [s to jump to next spelling mistake. z= or <leader>ps to pick a suggestion.
vim.keymap.set("n", "<Leader>gs", "<CMD>setlocal spell!<CR>", { desc="Toggle Spelling Actions" })

vim.keymap.set("n", "<leader><leader>", "<cmd>e #<CR>", { desc = "Previous File" })

vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Previous Buffer" })

vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next QuickFix" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Previous QuickFix" })

