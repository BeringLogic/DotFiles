return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<S-F12>", vim.lsp.buf.references, {})
      vim.keymap.set("n", "C-.", vim.lsp.buf.code_action, {})
    end,
  },
}

