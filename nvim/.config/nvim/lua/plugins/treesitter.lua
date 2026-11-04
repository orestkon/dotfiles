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
      "python",
      "rust",
    })
    -- Neovim core only starts Tree-sitter highlighting for a handful of
    -- filetypes (lua, markdown, help, query) via its ftplugins. Start it for
    -- every filetype with a parser so highlighting and plugins that walk the
    -- syntax tree (rainbow delimiters) work consistently.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(event)
        pcall(vim.treesitter.start, event.buf)
      end,
    })
  end,

  -- NOTE: Explore later: Treesitter can do more than syntax highlighting.
  -- - Incremental selection: expand/shrink selections by syntax structure.
  -- - Context: keep the current function/class visible while scrolling.
  -- - Textobjects: navigate and select functions, parameters, and more.
  -- See :help nvim-treesitter and the upstream plugin documentation.
}
