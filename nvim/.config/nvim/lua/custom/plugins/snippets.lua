return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			-- This line specifically tells LuaSnip to load the
			-- VS Code style snippets from friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
