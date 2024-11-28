return {
  "rmagatti/auto-session",
  lazy=false,

  keys = {
    { "<Leader>s/", "<cmd>Autosession search<CR>", desc="Auto-session Search" },
    { "<Leader>ss", "<cmd>SessionSave<CR>", desc="Auto-session Save" },
    { "<Leader>sr", "<cmd>SessionRestore<CR>", desc="Auto-session Restore" },
  },

  opts = {
    log_level="debug"
  }
}

