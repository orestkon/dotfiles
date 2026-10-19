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
		{ "<leader>cd", ":Neogen<CR>", desc = "[C]ode [D]ocumentation - TSDocs" },
	},
}
