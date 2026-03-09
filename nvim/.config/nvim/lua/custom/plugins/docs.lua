return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("neogen").setup({
			enabled = true,
			languages = {
				typescript = {
					template = {
						annotation_convention = "tsdoc",
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>nf", ":Neogen<CR>", desc = "Generate TSDoc" },
	},
}
