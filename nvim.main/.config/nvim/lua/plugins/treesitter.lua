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
              ["[i"] = { query = "@conditional.inner", desc = "Previous conditional" },
              ["[c"] = { query = "@comment.inner", desc = "Previous comment" },
            },
            goto_next_start = {
              ["]a"] = { query = "@parameter.inner", desc = "Next function argument" },
              ["]i"] = { query = "@conditional.inner", desc = "Next conditional" },
              ["]c"] = { query = "@comment.inner", desc = "Next comment" },
            },
          },
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["am"] = { query = "@function.outer",    desc = "Select outer method"   },
              ["im"] = { query = "@function.inner",    desc = "Select inner method"   },
              ["as"] = { query = "@local.scope",       desc = "Select inner scope"    },
              ["aa"] = { query = "@parameter.outer",   desc = "Select outer argument" },
              ["ia"] = { query = "@parameter.inner",   desc = "Select inner argument" },
              ["ai"] = { query = "@conditional.outer", desc = "Select outer conditional" },
              ["ii"] = { query = "@conditional.inner", desc = "Select inner conditional" },
              ["ac"] = { query = "@comment.outer",     desc = "Select outer comment" },
              ["ic"] = { query = "@comment.inner",     desc = "Select inner comment" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>snm"] = { query = "@function.outer", desc = "Swap with next method" },
              ["<leader>sna"] = { query = "@parameter.outer", desc = "Swap with next argument" },
              ["<leader>sni"] = { query = "@conditional.outer", desc = "Swap with next conditional" },
              ["<leader>snc"] = { query = "@comment.outer", desc = "Swap with next comment" },
            },
            swap_previous = {
              ["<leader>spm"] = { query = "@function.outer", desc = "Swap with previous method" },
              ["<leader>spa"] = { query = "@parameter.outer", desc = "Swap with previous argument" },
              ["<leader>spi"] = { query = "@conditional.outer", desc = "Swap with previous conditional" },
              ["<leader>spc"] = { query = "@comment.outer", desc = "Swap with previous comment" },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      mode = "topline",
    },
    keys = {
      { "[c", function() require("treesitter-context").go_to_context(vim.v.count1) end, desc = "Go to context" },
    },
  },
}
