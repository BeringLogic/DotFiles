return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      virtual_text = {
        enabled = true,
        key_bindings = {
          clear = "<S-Tab>",
          accept_line = "<M-Tab>",
          next = "<C-M-Tab>",
          prev = "<C-M-S-Tab>",
        }
      },
    })
  end,
}
