
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.backspace = { "indent", "eol", "start" }

vim.opt.swapfile = false

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.o.spelllang = "en_ca,fr"

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  underline = true,
  severity_sort = true,
  virtual_lines = true,
}

vim.opt.undofile = true

vim.opt.scrolloff = 5

vim.opt.list = true
-- vim.opt.listchars = { trail = "·", tab = "󰌒󰌒" }
vim.opt.listchars = { trail = "·", tab = "—" }

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight yanked text",
})
