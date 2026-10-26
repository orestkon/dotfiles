return {
  {
    "lervag/vimtex",
    lazy = false, -- Recommended by Vimtex for consistent behavior
    init = function()
      -- These MUST be in 'init' for Vimtex to pick them up correctly
      -- macOS: Skim. Linux/WSL: Zathura. Falls back to VimTeX's default
      -- ("general") when neither is available.
      if vim.fn.has("mac") == 1 then
        vim.g.vimtex_view_method = "skim"
      elseif vim.fn.executable("zathura") == 1 then
        vim.g.vimtex_view_method = "zathura_simple"
      end

      -- Skim-only behaviour; must not leak into other viewers.
      if vim.g.vimtex_view_method == "skim" then
        vim.g.vimtex_view_skim_activate = 0
        vim.g.vimtex_view_skim_sync = 1
      end

      vim.g.vimtex_view_automatic = 1

      vim.g.vimtex_compiler_latexmk = {
        executable = "latexmk",
        engine = "xelatex",
        build_dir = "build",
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-outdir=build",
        },
      }
    end,
  },
}
