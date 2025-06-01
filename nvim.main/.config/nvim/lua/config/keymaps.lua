
-- Spelling Suggestions: ]s and [s to jump to next spelling mistake. z= or <leader>ps to pick a suggestion.
vim.keymap.set("n", "<Leader>gs", "<CMD>setlocal spell!<CR>", { desc="Toggle Spelling Actions" })

vim.keymap.set("n", "<leader><leader>", "<cmd>e #<CR>", { desc = "Previous File" })

vim.keymap.set("n", "<leader>gd", "<CMD>lua vim.diagnostic.open_float()<CR>", { desc = "Show Diagnostics" })
vim.keymap.set("n", "<leader>gD", function()
  vim.g.diagnostic_virtual_lines = not vim.g.diagnostic_virtual_lines
  vim.diagnostic.config({ virtual_lines = vim.g.diagnostic_virtual_lines })
end, { desc = "Toggle Diagnostics Virtual Lines" })

vim.keymap.set("n", "<leader>tn", "<CMD>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "[t", "<CMD>tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "]t", "<CMD>tabnext<CR>", { desc = "Next Tab" })

vim.keymap.set("n", "<leader>td", "<CMD>e todo.md<CR>", { desc = "Edit todo.md" })

vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

