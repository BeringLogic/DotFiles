vim.cmd.colorscheme "catppuccin"

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

vim.opt.splitright = true
vim.opt.splitbelow = true

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
  virtual_lines = false,
}
vim.g.diagnostic_virtual_lines = false

vim.opt.undofile = true

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

vim.opt.list = true
vim.opt.listchars = { trail = "·", tab = "—" }

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight yanked text",
})

vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=4				-- open in prior window
vim.g.netrw_altv = 1					-- change from left splitting to right splitting
vim.g.netrw_liststyle=3					-- tree style view in netrw



-- Spelling Suggestions: ]s and [s to jump to next spelling mistake. z= or <leader>ps to pick a suggestion.
vim.keymap.set("n", "<Leader>gs", "<CMD>setlocal spell!<CR>", { desc="Toggle Spelling Actions" })

vim.keymap.set("n", "<leader><leader>", "<cmd>e #<CR>", { desc = "Previous File" })

vim.keymap.set("n", "<leader>gd", "<CMD>lua vim.diagnostic.open_float()<CR>", { desc = "Show Diagnostics" })
vim.keymap.set("n", "<leader>gD", function()
  vim.g.diagnostic_virtual_lines = not vim.g.diagnostic_virtual_lines
  vim.diagnostic.config({ virtual_lines = vim.g.diagnostic_virtual_lines })
end, { desc = "Toggle Diagnostics Virtual Lines" })

vim.keymap.set("n", "<leader>tn", "<CMD>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "[t", "<CMD>tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "]t", "<CMD>tabnext<CR>", { desc = "Next Tab" })

vim.keymap.set("n", "<leader>td", "<CMD>e todo.md<CR>", { desc = "Edit todo.md" })

vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<leader>e", "<CMD>Explore<CR>")

