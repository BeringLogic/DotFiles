
vim.g.mapleader = " "

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

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.o.spelllang = "en_ca,fr"

