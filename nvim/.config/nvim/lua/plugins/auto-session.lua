return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      vim.keymap.set("n", "<Leader>s/", "<cmd>Autosession search<CR>", { desc="Auto-session Search" }),
      vim.keymap.set("n", "<Leader>ss", "<cmd>SessionSave<CR>", { desc="Auto-session Save" }),
      vim.keymap.set("n", "<Leader>sr", "<cmd>SessionRestore<CR>", { desc="Auto-session Restore" }),
    })
  end
}

