return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    lazy = false,
    config = function()
      vim.lsp.config("emmet_language_server", {
        filetypes = { "html", "css", "template" },
      })
    end,
    keys = {
      { "<F12>",      function() vim.lsp.buf.definition() end,  desc = "Definitions" },
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Actions" },
      { "<F2>",       function() vim.lsp.buf.rename() end,      desc = "Rename" },
    },
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
}
