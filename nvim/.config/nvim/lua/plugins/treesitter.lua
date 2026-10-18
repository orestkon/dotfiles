-- NOTE: Highlight, edit, and navigate code
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		-- Install the parsers we want to use.
		require("nvim-treesitter").install({
			"bash",
			"c",
			"diff", -- Highlights changes in Git diffs.
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query", -- Treesitter query language.
			"vim",
			"vimdoc",
			"javascript",
			"typescript",
			"jsdoc",
			"regex",
		})
		-- FIXME: Treesitter highlighting works without a custom FileType autocmd.
		-- Identify what enables it during the later LSP/config audit.
	end,

	-- NOTE: Explore later: Treesitter can do more than syntax highlighting.
	-- - Incremental selection: expand/shrink selections by syntax structure.
	-- - Context: keep the current function/class visible while scrolling.
	-- - Textobjects: navigate and select functions, parameters, and more.
	-- See :help nvim-treesitter and the upstream plugin documentation.
}
