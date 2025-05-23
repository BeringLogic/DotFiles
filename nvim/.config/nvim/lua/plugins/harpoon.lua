return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n",  "<leader>hh",  function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,  { desc = "Harpoon UI" })
    vim.keymap.set("n",  "<leader>ha",  function() harpoon:list():add() end,                          { desc = "Harpoon Add" })
    vim.keymap.set("n",  "<leader>hd",  function() harpoon:list():remove() end,                       { desc = "Harpoon Remove" })
    vim.keymap.set("n",  "<leader>1",   function() harpoon:list():select(1) end,                      { desc = "Harpoon Select 1" })
    vim.keymap.set("n",  "<leader>2",   function() harpoon:list():select(2) end,                      { desc = "Harpoon Select 2" })
    vim.keymap.set("n",  "<leader>3",   function() harpoon:list():select(3) end,                      { desc = "Harpoon Select 3" })
    vim.keymap.set("n",  "<leader>4",   function() harpoon:list():select(4) end,                      { desc = "Harpoon Select 4" })
  end,
}
