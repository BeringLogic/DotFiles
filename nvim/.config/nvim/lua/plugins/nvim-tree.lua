return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- disable window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      git = {
        ignore = false,
      },
      renderer = {
        icons = {
          git_placement = "after",
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        api.config.mappings.default_on_attach(bufnr)

        local lefty = function()
          local node_at_cursor = api.tree.get_node_under_cursor()
          -- node_at_cursor.nodes to checks if has nodes (is a folder) and .open to check it's open
          if node_at_cursor.nodes and node_at_cursor.open then
            -- .open.edit() toggles the node (folder) from open to closed
            api.node.open.edit()
          else
            -- if instead node_at_cursor is a file or a closed folder, jump to the parent node (folder)
            api.node.navigate.parent()
          end
        end
        local righty = function()
          local node_at_cursor = api.tree.get_node_under_cursor()
          -- node_at_cursor.nodes to checks if has nodes (is a folder) and not .open to check it's closed
          if node_at_cursor.nodes and not node_at_cursor.open then
            -- .open.edit() toggles the node (folder) from closed to open
            api.node.open.edit()
            -- no else here, if it's an open folder or a file do nothing
          end
        end

        vim.keymap.set("n", "h", lefty, { buffer = bufnr, desc = "Fold folder or go to parent" })
        vim.keymap.set("n", "<Left>", lefty, { buffer = bufnr, desc = "Fold folder or go to parent" })
        vim.keymap.set("n", "l", righty, { buffer = bufnr, desc = "Unfold folder" })
        vim.keymap.set("n", "<Right>", righty, { buffer = bufnr, desc = "Unfold folder" })
      end,
    })

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  end,
}
