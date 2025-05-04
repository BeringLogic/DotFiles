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
          move = {
            enable = true,
            set_jumps = true,
            goto_previous_start = {
              ["[a"] = { query = "@parameter.inner", desc = "Previous function argument" },
            },
            goto_next_start = {
              ["]a"] = { query = "@parameter.inner", desc = "Next function argument" },
            },
          },
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
              ["aa"] = { query = "@parameter.outer", desc = "Select outer argument" },
              ["ia"] = { query = "@parameter.inner", desc = "Select inner argument" },
            },
          },
        },
      })
    end,
  },
}
