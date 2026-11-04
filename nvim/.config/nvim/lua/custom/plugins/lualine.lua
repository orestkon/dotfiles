-- NOTE: Statusline with the lualine "bubbles" look and Catppuccin Macchiato colors.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = function()
    -- Rounded caps from Nerd Fonts (Private Use Area).
    local cap_left = vim.fn.nr2char(0xE0B6)
    local cap_right = vim.fn.nr2char(0xE0B4)

    -- Show the current OS in the right corner.
    local function os_icon()
      local sysname = (vim.uv or vim.loop).os_uname().sysname
      if not vim.g.have_nerd_font then
        return sysname
      end
      local icons = {
        Darwin = vim.fn.nr2char(0xF179), -- nf-fa-apple
        Linux = vim.fn.nr2char(0xF17C), -- nf-fa-linux
        Windows_NT = vim.fn.nr2char(0xF17A), -- nf-fa-windows
      }
      return icons[sysname] or sysname
    end

    return {
      options = {
        theme = "catppuccin-macchiato",
        icons_enabled = vim.g.have_nerd_font,
        component_separators = "",
        section_separators = { left = cap_right, right = cap_left },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = cap_left }, right_padding = 2 } },
        lualine_b = {
          "branch",
          { "diff", colored = false },
          { "diagnostics", colored = false, sources = { "nvim_diagnostic" } },
        },
        lualine_c = { "filename" },
        lualine_x = { "lsp_status" },
        lualine_y = { "filetype", "searchcount" },
        lualine_z = {
          "location",
          { os_icon, separator = { right = cap_right }, padding = { left = 1, right = 1 } },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
    }
  end,
}
