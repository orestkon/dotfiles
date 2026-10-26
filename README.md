# Dotfiles

Personal, terminal-centric configuration for macOS (Apple Silicon) and Linux,
managed with [GNU Stow](https://www.gnu.org/software/stow/).

The setup covers zsh, Neovim, tmux, Ghostty, Yazi, fastfetch, Oh My Posh, and
OpenCode. Linux is supported through native package managers. WSL is
best-effort.

> **Note:** `scripts/` is a work in progress. Use the manual installation below
> as the reliable path; see [Installer](#installer-work-in-progress).

## Contents

| Package | What it configures | Docs |
| --- | --- | --- |
| `zsh/` | Shell, prompt (Oh My Posh), zinit, fzf, zoxide, aliases | — |
| `nvim/` | Neovim with lazy.nvim, LSP, Conform, Telescope, Yazi, VimTeX | [README](nvim/.config/nvim/README.md) |
| `tmux/` | tmux with `Ctrl+A` prefix and Catppuccin | [README](tmux/.config/tmux/README.md) |
| `ghostty/` | Ghostty terminal | — |
| `yazi/` | Yazi file manager and pinned Catppuccin flavor | — |
| `fastfetch/` | System information shown in the first shell | — |
| `ohmyposh/` | Prompt theme | — |
| `opencode/` | OpenCode CLI configuration | — |

## Requirements

- macOS on Apple Silicon, or Linux (Debian/Ubuntu, Fedora, Arch).
  Intel macOS is not supported by the Homebrew bootstrap.
- GNU Stow, Git, and curl.
- Neovim **0.11 or newer** — the configuration uses `vim.lsp.enable`.
- A recent **fzf** (0.48+) for `fzf --zsh`.
- **Node.js and npm** for the npm-based Mason tools (TypeScript server,
  Prettier).
- A C toolchain (`cc`, `make`) for Treesitter parsers.
- A **Nerd Font** for icons in eza, the tmux status bar, the prompt, and
  Neovim. Ghostty is configured to use JetBrainsMono Nerd Font Mono; install it
  (see the dependency table) or change `font-family` in the Ghostty config.

### Dependencies

| Tool | Used for | macOS |
| --- | --- | --- |
| `git` | Cloning, zinit, TPM | `brew install git` |
| `stow` | Deploying the packages | `brew install stow` |
| `zsh` | Shell | `brew install zsh` |
| `tmux` | Terminal multiplexer | `brew install tmux` |
| `neovim` | Editor | `brew install neovim` |
| `eza` | `ls` aliases, fzf previews | `brew install eza` |
| `bat` | `cat` alias, fzf previews | `brew install bat` |
| `fd` | fzf file discovery | `brew install fd` |
| `fzf` | Fuzzy finding, completions | `brew install fzf` |
| `zoxide` | Smarter `cd` | `brew install zoxide` |
| `thefuck` | Command correction | `brew install thefuck` |
| `yazi` | File manager | `brew install yazi` |
| `fastfetch` | First-shell system info | `brew install fastfetch` |
| `oh-my-posh` | Prompt | `brew install oh-my-posh` |
| `node` / `npm` | Mason formatters and LSPs | `brew install node` |
| `ripgrep` | Telescope live grep | `brew install ripgrep` |
| `lazygit` | Optional Snacks integration | `brew install lazygit` |
| `ghostty` | Terminal (optional) | `brew install --cask ghostty` |
| Nerd Font | Icons; Ghostty font | `brew install --cask font-jetbrains-mono-nerd-font` |

### Linux packages

Debian/Ubuntu:

```sh
sudo apt install stow git curl zsh tmux neovim eza bat fd-find fzf zoxide \
  thefuck ripgrep build-essential nodejs npm
# Debian/Ubuntu rename these binaries to avoid clashes with other packages.
mkdir -p ~/bin
ln -s "$(command -v fdfind)" ~/bin/fd
ln -s "$(command -v batcat)" ~/bin/bat
```

Fedora:

```sh
sudo dnf install stow git curl zsh tmux neovim eza bat fd-find fzf zoxide \
  thefuck yazi fastfetch ripgrep gcc make nodejs npm
```

Arch:

```sh
sudo pacman -S stow git curl zsh tmux neovim eza bat fd fzf zoxide thefuck \
  yazi fastfetch ripgrep base-devel nodejs npm
```

Availability varies by release:

- **Neovim:** distro packages may be older than 0.11. Use the AppImage, the
  unstable PPA, or a tarball if `nvim --version` is too old.
- **fzf:** distro versions older than 0.48 do not support `fzf --zsh`.
- **Yazi**, **fastfetch**, **Oh My Posh:** install from upstream releases (or
  AUR for Oh My Posh) when your distro does not package them.

## Installation

### 1. Clone the repository

```sh
git clone git@github.com:orestkon/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Use `https://github.com/orestkon/dotfiles.git` if you do not have SSH keys set
up.

### 2. Install the dependencies

Install the tools listed above with Homebrew or your Linux package manager.

### 3. Stow the packages

From the repository root:

```sh
stow fastfetch ghostty nvim ohmyposh tmux yazi zsh
stow --no-folding opencode
```

Stow folds directories by default: when a target directory does not exist, the
whole package directory becomes a single symlink, so new files appear without
re-stowing. `opencode` is the exception — it stores runtime state
(`node_modules`, `service.json`, ...) in `~/.config/opencode`, so it is stowed
with `--no-folding` to keep that state out of this repository.

### 4. Finish per-tool setup

**Shell** — make zsh the login shell, then start a new session:

```sh
chsh -s "$(command -v zsh)"
```

**tmux** — install TPM itself, then start tmux and press `Prefix + I` to
install the configured plugins:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux
```

**Neovim** — launch it once; `lazy.nvim` installs plugins and
`mason-tool-installer` installs the language servers and formatters:

```sh
nvim
```

Then check the setup with `:checkhealth`. Mason installs `lua_ls`, `ts_ls`,
`stylua`, `prettier`, `ruff`, `taplo`, and `shfmt`.

**Yazi** — install the pinned flavor:

```sh
ya pkg install
```

**Ghostty** — install the terminal and the JetBrains Mono Nerd Font. The config
selects `JetBrainsMono Nerd Font Mono`; change `font-family` there if you use a
different font. The custom shaders are commented out by default.

**fastfetch** — runs once per new terminal, in the first shell only.

### 5. Optional components

**TeX / VimTeX** — install a TeX distribution plus a PDF viewer:

- macOS: MacTeX or BasicTeX, and Skim. VimTeX uses Skim automatically.
- Linux: `texlive` with `latexmk` and `xelatex`, plus Zathura
  (`zathura-pdf-mupdf` or `zathura-pdf-poppler`). VimTeX uses
  `zathura_simple` when available.
- Skim inverse search is configured once in Skim's **Sync** preferences:
  `/opt/homebrew/bin/nvim --headless -c "VimtexInverseSearch %line '%file'"`.

**OpenCode** — install it separately, then create the API key file referenced
by the configuration. The path `~/.secrets/deepseek-key-opencode` is hardcoded
in `opencode.json`; if you prefer another location, update that file. Keeping
keys in a private directory such as `$HOME/.secrets` is recommended, and the
configuration denies reads of that directory:

```sh
mkdir -p ~/.secrets
printf '%s' 'your-deepseek-key' > ~/.secrets/deepseek-key-opencode
chmod 600 ~/.secrets/deepseek-key-opencode
```

**macOS defaults** — `scripts/macosSettings.sh` applies Dock/Finder preferences
and restarts both. Review it before running; it is macOS-only.

## Installer (work in progress)

`scripts/install.sh` detects the OS, installs core packages, clones this
repository into `~/dotfiles`, stows the packages, and (on macOS) applies the
system defaults. It currently installs only core tools (`git`, `curl`, `stow`,
`zsh`, `tmux`, `neovim`) and expects an optional `Brewfile` that is not in the
repository yet.

Until it is complete, use the manual steps above. If you run it anyway, note
that it sources `macosSettings.sh` on macOS and therefore restarts Dock and
Finder.

## Repository layout

```text
.
├── fastfetch/  ghostty/  nvim/  ohmyposh/  opencode/  tmux/  yazi/  zsh/
├── scripts/          # installer helpers (work in progress, never stowed)
├── .gitattributes    # LF line endings
├── .stow-ignore      # directories the installer skips
├── AGENTS.md         # guidance for coding agents
└── README.md
```

Each top-level directory except `scripts/` is a GNU Stow package that mirrors
`$HOME`.

## Notes

- `fd` and `bat` are named `fdfind` and `batcat` on Debian/Ubuntu; `~/bin`
  symlinks give the config the names it calls.
- Neovim formatters are managed by Mason; npm must be available.
- The OpenCode key is read from `~/.secrets/deepseek-key-opencode` and is never
  committed.
- zsh initializes fzf, zoxide, thefuck, and Oh My Posh at startup. If one is
  missing, every new shell prints an error; install it or comment out the
  corresponding module.
- Linux on WSL needs WSLg (or an X server) for GUI tools such as Zathura.

## License

MIT — see [LICENSE](LICENSE).

## Credits

- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) — starting point
  for the Neovim configuration.
- [Catppuccin](https://github.com/catppuccin) — colorschemes across the setup.
