-- NOTE: Highlight todo, notes, etc in comments
return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}

-- EXAMPLES!!!!
-- TODO: Extract this into a separate module.
-- FIXME: Handle this edge case.
-- HACK: Temporary workaround until the API changes.
-- WARN: This operation modifies user data.
-- PERF: Avoid repeated parsing here.
-- NOTE: Keep this compatible with Neovim 0.12.
-- TEST: Add coverage for the failure case.
