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
      vim.keymap.set("n", "<leader>f/", "<cmd>Telescope live_grep theme=dropdown<CR>", { desc = "Find word using grep" })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers theme=dropdown<CR>", { desc = "Find Registers" })
      vim.keymap.set("n", "<leader>f:", "<cmd>Telescope commands theme=dropdown<CR>", { desc = "Find Commands" })

      require("telescope").load_extension("ui-select")
    end,
  },
}

