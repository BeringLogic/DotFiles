return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']g', gitsigns.next_hunk, { desc = 'Next Git Hunk' })
        map('n', '[g', gitsigns.prev_hunk, { desc = 'Previous Git Hunk' })
        map('n', '<leader>gh', gitsigns.preview_hunk_inline, { desc = 'Preview Git Hunk' })
      end
    })
  end,
}
