return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        autotag = { enable = true }, -- enable autotagging (w/ nvim-ts-autotag plugin)
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-s>",
            node_incremental = "<C-s>",
            scope_incremental = false,
            node_decremental = "<Backspace>",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = { query = "@function.outer", desc = "Select outer function" },
              ["if"] = { query = "@function.inner", desc = "Select inner function" },
              ["am"] = { query = "@function.outer", desc = "Select outer function" },
              ["im"] = { query = "@function.inner", desc = "Select inner function" },
              ["ac"] = { query = "@class.outer", desc = "Select outer class" },
              ["ic"] = { query = "@class.inner", desc = "Select inner class" },
              ["as"] = { query = "@local.scope", desc = "Select inner scope" },
            },
          },
        },
      })
    end,
  },
}
