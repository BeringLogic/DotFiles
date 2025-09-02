return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      bash = { "beautysh" },
      lua = { "stylua" },
      go = { "gofumpt" },
      javascript = { "prettierd" },
    },
  },
  keys = {
    { "<leader>gf", function() require("conform").format({ async = true, lsp_format = "fallback" }) end, desc = "Format", },
  },
}
