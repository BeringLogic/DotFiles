return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	opts = {
		completions = { lsp = { enabled = true } },
    anti_conceal = { enabled = false },
  },
}
