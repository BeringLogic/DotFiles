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
					{ key = "e", icon = "", desc = "New File", action = "<cmd>enew<CR>" },
					{ key = "SPC ee", icon = "", desc = "Toggle file explorer", action = "<cmd>NvimTreeToggle<CR>" },
					{ key = "C-p", icon = "󰱼", desc = "Find File", action = "<cmd>Telescope find_files<CR>" },
					{ key = "SPC f/", icon = "", desc = "Find using grep", action = "<cmd>Telescope live_grep<CR>" },
					{ key = "SPC fm", icon = "", desc = "Find Marks", action = "<cmd>Telescope marks<CR>" },
					{ key = "SPC f:", icon = "", desc = "Find Commands", action = "<cmd>Telescope commands<CR>" },
					{ key = "SPC ft", icon = "󰱼", desc = "Find TODOs", action = "<cmd>TodoTelescope<CR>" },
					{ key = "SPC lg", icon = "", desc = "Lazy Git", action = "<cmd>LazyGit<CR>" },
					{ key = "q", icon = "󰩈", desc = "Quit", action = "<cmd>qa<CR>" },
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
					{ section = "recent_files", icon = "", title = "Recent Files", indent = 2 },
				},
			},
		},
		dim = { enabled = true },
		indent = {
			indent = {
				enabled = true,
				char = "┆", -- choose from '┆', '┊', '¦', ':'
			},
			scope = {
				enabled = true,
				char = "┆", -- choose from '┆', '┊', '¦', ':'
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
    },
		quickfile = { enabled = true },
		rename = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		win = { enabled = true },
	},
	keys = {
    { "<leader>lg", function() Snacks.lazygit.open() end, desc = "LazyGit", },
    { "<C-p>", function() Snacks.picker.files({ hidden = true, matcher = { frecency = true }}) end, desc = "Find Files" },
    { "<leader>pb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>p/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>pn", function() Snacks.picker.notifications({ win = { preview = { wo = { wrap = true } } } }) end, desc = "Notification History" },
    { "<leader>pr", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<F24>", function() Snacks.picker.lsp_references() end, desc = "LSP References" }, -- SHIFT-F12
    { "<leader>p:", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>pd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>pk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>pm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>pq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>py", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>ps", function() Snacks.picker.spelling() end, desc = "Spelling Options" },
    { "<leader>pt", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "TODOs" },
    { "<leader>ph", function() Snacks.picker.help() end, desc = "Help" },
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
