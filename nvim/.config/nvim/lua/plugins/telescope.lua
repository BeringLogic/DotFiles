return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--follow", -- Follow symbolic links
						"--hidden", -- Search for hidden files
						"--no-heading", -- Don't group matches by each file
						"--with-filename", -- Print the file path with the matched lines
						"--line-number", -- Show line numbers
						"--column", -- Show column numbers
						"--smart-case", -- Smart case search
					},
				},
        pickers = {
          find_files = {
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--follow",
              "--glob",
              "!**/.git/*",
              "--color",
              "never"
            }
          }
        },
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			vim.keymap.set(
				"n",
				"<C-p>",
				"<cmd>Telescope find_files theme=dropdown previewer=false<CR>",
				{ desc = "Find File" }
			)
			vim.keymap.set(
				"n",
				"<leader>f/",
				"<cmd>Telescope live_grep theme=dropdown<CR>",
				{ desc = "Find word using grep" }
			)
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
			vim.keymap.set(
				"n",
				"<leader>fr",
				"<cmd>Telescope registers theme=dropdown<CR>",
				{ desc = "Find Registers" }
			)
			vim.keymap.set("n", "<leader>f:", "<cmd>Telescope commands theme=dropdown<CR>", { desc = "Find Commands" })
			vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", { desc = "Find Marks" })
			vim.keymap.set(
				"n",
				"<leader>fs",
				"<cmd>Telescope spell_suggest theme=dropdown<CR>",
				{ desc = "Find Spelling Suggestions" }
			)

			vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { desc = "Find QuickFix" })
			vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next QuickFix" })
			vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Previous QuickFix" })

      vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Find Diagnostics" })
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fy", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find Document Symbols" })

			require("telescope").load_extension("ui-select")
		end,
	},
}
