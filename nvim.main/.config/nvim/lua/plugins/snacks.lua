return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = { enabled = true },
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { key = "s",       icon = "",  desc = "Load Session",          action = "<cmd>lua require('persistence').load()<CR>" },
          { key = "n",       icon = "",  desc = "New File",              action = "<cmd>enew<CR>" },
          { key = "SPC e",   icon = "",  desc = "Toggle file explorer",  action = "<cmd>NvimTreeToggle<CR>" },
          { key = "C-p",     icon = "󰱼",  desc = "Find File",             action = "<cmd>lua Snacks.picker.files()<CR>" },
          { key = "SPC p/",  icon = "",  desc = "Find using grep",       action = "<cmd>lua Snacks.picker.grep()<CR>" },
          { key = "SPC pk",  icon = "",  desc = "Find Keymaps",          action = "<cmd>lua Snacks.picker.keymaps()<CR>" },
          { key = "SPC ph",  icon = "?",  desc = "Find Help",             action = "<cmd>lua Snacks.picker.help()<CR>" },
          { key = "SPC lg",  icon = "",  desc = "Lazy Git",              action = "<cmd>lua Snacks.lazygit.open()<CR>" },
          { key = "q",       icon = "󰩈",  desc = "Quit",                  action = "<cmd>qa<CR>" },
        },
      },
      sections = {
        {
          section = "terminal",
          cmd = "cat ~/Images/Kyrsha\\ devant\\ l\\'ordi.txt; sleep .1",
          height = 16,
        },
        {
          pane = 2,
          { section = "keys", padding = 1 },
          { section = "projects", icon = "", title = "Projects", indent = 2 },
        },
      },
    },
    dim = { enabled = true },
    indent = {
      indent = {
        enabled = true,
        char = "¦", -- choose from '┆', '┊', '¦', ':'
      },
      scope = {
        enabled = true,
        char = "¦", -- choose from '┆', '┊', '¦', ':'
      },
    },
    input = {
      enabled = true,
      icon = " ",
      icon_hl = "SnacksInputIcon",
      win = { style = "input" },
      expand = true,
    },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<PageUp>"] = { "preview_scroll_up", mode = { "n", "i" } },
            ["<PageDown>"] = { "preview_scroll_down", mode = { "n", "i" } },
          }
        },
        list = {
          keys = {
            ["<PageUp>"] = "preview_scroll_up",
            ["<PageDown>"] = "preview_scroll_down",
          }
        }
      }
    },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    styles = {
      notification_history = {
        wo = { wrap = true }
      }
    },
  },
  keys = {
    { "<leader>lg",  function() Snacks.lazygit.open() end,                                                                                  desc = "LazyGit", },
    { "<C-p>",       function() Snacks.picker.files({ hidden = true, matcher = { frecency = true }}) end,                                   desc = "Find Files" },
    { "<C-s-p>",     function() Snacks.picker.files({ hidden = true, matcher = { frecency = true }, cwd = vim.fn.stdpath("config") }) end,  desc = "Find Config Files" },
    { "<leader>pn",  function() Snacks.picker.files({ matcher = { frecency = true }, cwd = "~/Documents/Notes" }) end,                      desc = "Find Notes" },
    { "<leader>pb",  function() Snacks.picker.buffers() end,                                                                                desc = "Buffers" },
    { "<leader>p/",  function() Snacks.picker.grep() end,                                                                                   desc = "Grep" },
    { "<leader>n",   function() Snacks.notifier.show_history() end,                                                                         desc = "Notification History" },
    { "<leader>pr",  function() Snacks.picker.registers() end,                                                                              desc = "Registers" },
    { "<F24>",       function() Snacks.picker.lsp_references() end,                                                                         desc = "LSP References" }, -- SHIFT-F12
    { "<leader>p:",  function() Snacks.picker.commands() end,                                                                               desc = "Commands" },
    { "<leader>pd",  function() Snacks.picker.diagnostics() end,                                                                            desc = "Diagnostics" },
    { "<leader>pk",  function() Snacks.picker.keymaps() end,                                                                                desc = "Keymaps" },
    { "<leader>pm",  function() Snacks.picker.marks() end,                                                                                  desc = "Marks" },
    { "<leader>pq",  function() Snacks.picker.qflist() end,                                                                                 desc = "Quickfix List" },
    { "<leader>py",  function() Snacks.picker.lsp_symbols() end,                                                                            desc = "LSP Symbols" },
    { "<leader>ps",  function() Snacks.picker.spelling() end,                                                                               desc = "Spelling Options" },
    { "<leader>pt",  function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end,                                 desc = "TODOs" },
    { "<leader>ph",  function() Snacks.picker.help() end,                                                                                   desc = "Help" },
    { "<leader>pp",  function() Snacks.picker.projects() end,                                                                               desc = "Projects" },
    { "<leader>pi",  function() Snacks.picker.icons() end,                                                                                  desc = "Icons" },
    { "<leader>pg",  function() Snacks.picker.git_diff() end,                                                                               desc = "git diffs" },
    { "<leader>pt",  function() Snacks.picker.treesitter() end,                                                                             desc = "Treesitter" },
  },
  init = function()
    local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
    vim.api.nvim_create_autocmd("User", {
      pattern = "NvimTreeSetup",
      callback = function()
        local events = require("nvim-tree.api").events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
            data = data
            Snacks.rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
    })
  end,
}
