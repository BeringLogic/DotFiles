return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		rename = { enabled = true },
		statuscolumn = { enabled = true },
		animate = { enabled = true },
		dim = { enabled = true },
		input = {
			enabled = true,
			icon = " ",
			icon_hl = "SnacksInputIcon",
			win = { style = "input" },
			expand = true,
		},
		scroll = { enabled = true },
		win = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
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
	},
	keys = {
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
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
