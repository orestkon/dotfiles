return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
      explorer = {
        enabled = true,
        replace_netrw = false,
        trash = true,
      },

      picker = {
        enabled = true,
      },

      lazygit = {
        enabled = true,
      },

      terminal = {
        enabled = true,
        win = {
          style = "terminal",
          position = "float",
          width = 0.8,
          height = 0.8,
          border = "rounded",
          backdrop = false,
          wo = {
            winblend = 10,
          },
        },
      },

      scroll = {
        enabled = true,
        animate = {
          duration = { step = 10, total = 250 },
          easing = "outCubic",
        },
        animate_repeat = {
          delay = 100,
          duration = { step = 6, total = 100 },
          easing = "linear",
        },
      },
    },

    keys = {
      {
        "<leader>fs",
        function()
          require("snacks").explorer()
        end,
        desc = "[F]ile Explorer - [S]nacks",
      },
      {
        "<leader>lg",
        function()
          require("snacks").lazygit()
        end,
        desc = "[L]azy[g]it",
      },
      {
        "<leader>ll",
        function()
          require("snacks").lazygit.log()
        end,
        desc = "[L]azygit [L]og",
      },
      {
        "<leader>tt",
        function()
          require("snacks").terminal.toggle(vim.o.shell, {
            auto_close = false,
            win = {
              style = "terminal",
              position = "float",
              width = 0.8,
              height = 0.8,
              border = "rounded",
              backdrop = false,
              wo = {
                winblend = 10,
              },
            },
          })
        end,
        desc = "[T]oggle [T]erminal",
      },
    },
  },
}
