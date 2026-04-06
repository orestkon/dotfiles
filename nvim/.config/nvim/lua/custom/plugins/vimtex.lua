return {
	{
		"lervag/vimtex",
		lazy = false, -- Recommended by Vimtex for consistent behavior
		init = function()
			-- These MUST be in 'init' for Vimtex to pick them up correctly
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_view_skim_activate = 0
			vim.g.vimtex_view_skim_sync = 1

			vim.g.vimtex_compiler_latexmk = {
				engine = "xelatex",
				options = {
					"-shell-escape",
					"-verbose",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
				},
			}
		end,
	},
}
