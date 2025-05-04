return {
  "bullets-vim/bullets.vim",
  init = function()
    vim.g.bullets_set_mappings = 0
    vim.g.bullets_enabled_file_types = {
      "markdown",
      "text",
    }
    vim.g.bullets_outline_levels = { "num", "abc", "rom", "std-", "std*", "std+" }
    vim.g.bullets_custom_mappings = {
      { "nmap", "<leader>bx", "<Plug>(bullets-toggle-checkbox)" },
      { "nmap", "o",          "<Plug>(bullets-newline)" },
      { "imap", "<cr>",       "<Plug>(bullets-newline)" },
      { "nmap", ">>",         "<Plug>(bullets-demote)" },
      { "nmap", "<<",         "<Plug>(bullets-promote)" },
      { "vmap", "<",          "<Plug>(bullets-promote)" },
      { "vmap", ">",          "<Plug>(bullets-demote)" },
      { "nmap", "<leader>br", "<Plug>(bullets-renumber)" },
      { "vmap", "<leader>br", "<Plug>(bullets-renumber)" },
    }
  end,
}
