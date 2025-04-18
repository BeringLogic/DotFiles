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
    dependencies = {
      "saghen/blink.cmp",
    },
    lazy = false,
    config = function()
      servers = {
        gopls = {},
        cssls = {},
        bashls = {},
        html = {},
        jsonls = {},
        lua_ls = {},
        sqlls = {},
      }
      local lspconfig = require("lspconfig")
      for server, config in pairs(servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
    keys = {
      { "<F12>",      function() vim.lsp.buf.definition() end,  desc = "Definitions" },
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Actions" },
      { "<F2>",       function() vim.lsp.buf.rename() end,      desc = "Rename" },
    },
  },
}
