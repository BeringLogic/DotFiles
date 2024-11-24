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
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find File" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent File" })
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find word using grep" })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs" })

      require("telescope").load_extension("ui-select")
    end,
  },
}

