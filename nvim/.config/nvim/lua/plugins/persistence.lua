return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {},
  keys = {
    { "<leader>sl", "<cmd>lua require('persistence').load()<cr>", desc = "Restore Session" },
    { "<leader>ss", "<cmd>lua require('persistence').select()<cr>", desc = "Select Session" },
    { "<leader>sd", "<cmd>lua require('persistence').stop()<cr>", desc = "Don't save session on exit" },
  },
}
