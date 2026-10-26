-- Autoformat
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      rust = { "rustfmt" },
      json = { "prettier_json" },
      jsonc = { "prettier_json" },
      yaml = { "prettier" },
      toml = { "taplo" },
      sh = { "shfmt" },
      typescript = { "prettier" },
      javascript = { "prettier" },
      typescriptreact = { "prettier" },
      javascriptreact = { "prettier" },
    },
    formatters = {
      prettier = {
        prepend_args = { "--no-semi", "--single-quote", "--trailing-comma", "all", "--print-width", "120" },
      },
      -- JSON and JSONC must never get trailing commas.
      prettier_json = {
        inherit = "prettier",
        prepend_args = { "--trailing-comma", "none" },
      },
    },
  },
}
