# Neovim Configuration

My personal Neovim configuration, maintained as part of my [dotfiles](https://github.com/orestkon/dotfiles) repository. It started from [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and has since been modularized and adapted to my workflow.

The configuration provides language support, code completion and formatting, navigation, Git integration, and tools for Markdown and LaTeX.

## Features

- Modular Lua configuration.
- LSP support, completion, snippets, and formatting.
- Syntax highlighting and language parsing through Treesitter.
- File navigation, fuzzy finding, and Git integration.
- Markdown and LaTeX writing support.
- Integration with terminal tools, including Yazi and Lazygit.
- A customized interface using Catppuccin Macchiato.

## Plugins

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim). The following list describes the main tools in the configuration.

### Completion and editing

- [blink.cmp](https://github.com/Saghen/blink.cmp) — completion.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) — snippet engine and snippet support.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) — automatic pairing of brackets and quotes.
- [mini.nvim](https://github.com/echasnovski/mini.nvim) — text objects, surrounding operations, and statusline.
- [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim) — automatic indentation detection.

### Language support

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — Language Server Protocol configuration.
- [conform.nvim](https://github.com/stevearc/conform.nvim) — code formatting.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — syntax parsing and highlighting.
- [lazydev.nvim](https://github.com/folke/lazydev.nvim) — Lua development support for Neovim configuration.

### Navigation and Git

- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — fuzzy finding and navigation.
- [snacks.nvim](https://github.com/folke/snacks.nvim) — explorer, terminal, Lazygit integration, and scrolling animations.
- [yazi.nvim](https://github.com/mikavilpas/yazi.nvim) — integration with the Yazi terminal file manager.
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) — Git change indicators and hunk operations.
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) — highlighting and searching TODO-style comments.
- [which-key.nvim](https://github.com/folke/which-key.nvim) — keybinding menus.

### Interface

- [Catppuccin](https://github.com/catppuccin/nvim) — Macchiato colorscheme.
- [noice.nvim](https://github.com/folke/noice.nvim) — command-line, messages, and popup-menu UI.

### Writing and documentation

- [VimTeX](https://github.com/lervag/vimtex) — LaTeX editing and compilation workflow.
- Additional modules for Markdown, snippets, and documentation workflows.

## Configuration Structure

The configuration is organized into three main areas.

```text
.
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── config/
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   └── options.lua
│   ├── plugins/
│   │   └── ...
│   ├── custom/
│   │   └── plugins/
│   │       └── ...
│   └── kickstart/
│       └── ...
└── README.md
```

- `lua/config/` — core options, keymaps, and autocommands.
- `lua/plugins/` — plugin specifications adopted from the original Kickstart configuration and incorporated into my setup.
- `lua/custom/plugins/` — personal additions and integrations.
- `lua/kickstart/` — reference material.

The distinction between `lua/plugins/` and `lua/custom/plugins/` is intentional. It keeps the original configuration's extracted modules separate from personal additions while the setup continues to evolve.

## Installation

### Prerequisites

- Neovim
- Git
- Additional external tools required by the selected features, such as language servers, formatters, or other plugin dependencies.

### Setup

Deploy the configuration using the instructions in the dotfiles repository [README.md](https://github.com/orestkon/dotfiles/blob/main/README.md).

Start Neovim:

```sh
nvim
```

On first launch, `lazy.nvim` installs the configured plugins.

- `:Lazy` — inspect plugin status.
- `:checkhealth` — check Neovim and its configured components for potential issues.

## Maintenance

- `:Lazy` — inspect installed plugins and their status.
- `:Lazy sync` — synchronize plugin installations and updates.
- `lazy-lock.json` — records plugin revisions for reproducible installations.

Review changes before updating plugins or modifying the configuration. Keep the lockfile under version control so plugin versions remain consistent across machines.

## Credits

This configuration began with [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), whose structure, documentation, and examples provided the starting point for this setup.

See the repository's `LICENSE` file for licensing information.
