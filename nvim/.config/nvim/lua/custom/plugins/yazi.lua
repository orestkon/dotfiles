return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>fe",
			function()
				require("yazi").yazi()
			end,
			desc = "[F]ile [E]xplorer (Yazi)",
		},
		{
			-- Optional: Open Yazi in the directory of the current file
			"<leader>fE",
			function()
				require("yazi").yazi(nil, vim.fn.expand("%:p:h"))
			end,
			desc = "[F]ile [E]xplorer (Yazi) in current directory",
		},
	},
	opts = {
		-- if you want to open yazi instead of netrw
		open_for_directories = true,
		floating_window_override_conf = {
			border = "rounded", -- Makes it look much cleaner
			zindex = 50,
		},
	},
}
