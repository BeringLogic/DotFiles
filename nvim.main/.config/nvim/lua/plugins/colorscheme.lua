return {

  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "catppuccin-mocha"
  --   end
  -- }

  {
    "oncomouse/lushwal.nvim",
    cmd = { "LushwalCompile" },
    dependencies = {
      { "rktjmp/lush.nvim" },
      { "rktjmp/shipwright.nvim" },
    },
    lazy = false,
    init = function()
      vim.g.lushwal_configuration = {
        transparent_background = true,
        terminal_colors = false,
        addons = {
          gitsigns_nvim = true,
          hop_nvim = true,
          lualine = true,
          markdown = true,
          nvim_tree_lua = true,
          which_key_nvim = true,
        },
      }
    end,
  }

}

