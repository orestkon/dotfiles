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
		})

		-- Enable Treesitter highlighting for supported filetypes.
		-- 	vim.api.nvim_create_autocmd("FileType", {
		-- 		callback = function(args)
		-- 			-- Start only when a parser is available.
		-- 			local language = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
		--
		-- 			if language then
		-- 				vim.treesitter.start(args.buf, language)
		-- 			end
		-- 		end,
		-- 	})
	end,

	-- NOTE: Explore later: Treesitter can do more than syntax highlighting.
	-- - Incremental selection: expand/shrink selections by syntax structure.
	-- - Context: keep the current function/class visible while scrolling.
	-- - Textobjects: navigate and select functions, parameters, and more.
	-- See :help nvim-treesitter and the upstream plugin documentation.
}
