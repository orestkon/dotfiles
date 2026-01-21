return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")

		-- 1. Load standard snippets but EXCLUDE the bad rafce
		require("luasnip.loaders.from_vscode").lazy_load({
			exclude = { "rafce" },
		})

		-- 2. Define your superior, mirroring version
		ls.add_snippets("typescriptreact", {
			ls.snippet("rafce", {
				ls.text_node("const "),
				ls.insert_node(1, "ComponentName"),
				ls.text_node(" = () => {"),
				ls.text_node({ "", "  return <div>" }),
				ls.insert_node(0),
				ls.text_node("</div>;"),
				ls.text_node({ "", "};", "", "export default " }),
				-- The mirror node
				ls.function_node(function(args)
					return args[1][1]
				end, { 1 }),
				ls.text_node(";"),
			}),
		})

		-- Ensure it works in both TSX and JSX
		ls.filetype_extend("javascriptreact", { "typescriptreact" })
	end,
}
