# tmux Configuration

My personal tmux configuration, managed through GNU Stow.

## Structure

- `tmux.conf` — Core settings, configuration imports, TPM initialization, and UI overrides.
- `bindings.conf` — Key bindings for sessions, windows, panes, and copy mode.
- `catppuccin.conf` — Catppuccin theme and status bar configuration.
- `sessionx.conf` — SessionX configuration, currently not sourced (see [SessionX](#sessionx)).

## Dependencies

- tmux (tested with 3.8).
- Git and [TPM](https://github.com/tmux-plugins/tpm) for plugins.
- A Nerd Font for the Catppuccin status bar glyphs.
- Optional, only if SessionX is enabled: fzf and zoxide.

## Installation

From the root of the dotfiles repository:

```bash
stow tmux
```

Stow links the configuration under `~/.config/tmux/`. TPM itself is not managed by Stow and must be cloned separately:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Start tmux and press `Prefix + I` to install the configured plugins. Reload the configuration with `Prefix + r`.

## Usage

- **Prefix:** `Ctrl+A`
- **Reload configuration:** `Prefix + r`
- **Pane navigation:** `Prefix + h/j/k/l`
- **Horizontal split:** `Prefix + |`
- **Vertical split:** `Prefix + -`
- **Switch window:** `Alt + 1..6`
- **Kill window / session:** `Prefix + x` / `Prefix + X`
- **Copy mode:** `Prefix + [` (select with `v`, yank with `y`)

## Plugins

Plugins are managed by TPM and declared in the configuration. [Catppuccin for tmux](https://github.com/catppuccin/tmux) is active; SessionX is declared but not loaded. Plugin repositories live under `~/.config/tmux/plugins/` and are excluded from version control.

To install or update configured plugins, start tmux and press `Prefix + I`.

## SessionX

`sessionx.conf` is kept in the repository but is not sourced by `tmux.conf`. To enable it, add this to `tmux.conf`:

```tmux
source-file ~/.config/tmux/sessionx.conf
```

Then install the plugin and its dependencies (fzf and zoxide). The configured binding is `Prefix + o`, and the repository browser path is `~/dotfiles`.

## Notes

- `focus-events on` forwards terminal focus events to applications, which lets Neovim reload files changed on disk when you return to its pane. Changing this option requires detaching and reattaching the tmux client.
- UI changes should be tested after reloading the configuration or starting a fresh tmux server.

## References

- [tmux configuration tutorial (YouTube)](https://www.youtube.com/watch?v=GH3kpsbbERo&t=250s) — The tutorial that inspired this configuration. Useful for understanding the original setup and revisiting the reasoning behind individual choices.
