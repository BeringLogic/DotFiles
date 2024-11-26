return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files theme=dropdown previewer=false<CR>", { desc = "Find File" })
      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles theme=dropdown previewer=false<CR>", { desc = "Find Recent File" })
      vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep theme=dropdown<CR>", { desc = "Find word using grep" })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })

      require("telescope").load_extension("ui-select")
    end,
  },
}

