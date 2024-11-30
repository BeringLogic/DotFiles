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
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc="Hover" })
      vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, { desc="Definitions" })
      vim.keymap.set("n", "<S-F12>", vim.lsp.buf.references, { desc="References" })
      vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { desc="Code Actions" })
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc="Rename" })
    end,
  },
}

