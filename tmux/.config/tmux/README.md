# tmux Configuration

My personal tmux configuration, managed through GNU Stow.

## Structure

- `tmux.conf` — Core settings, configuration imports, TPM initialization, and UI overrides.
- `bindings.conf` — Custom key bindings and pane navigation.
- `catppuccin.conf` — Catppuccin theme and status bar configuration.
- `sessionx.conf` — Inactive SessionX configuration, retained for future evaluation.

## Installation

From the root of the dotfiles repository:

```bash
stow tmux
```

GNU Stow creates symlinks under `~/.config/tmux/`.

## Usage

- **Prefix:** `Ctrl+A`
- **Reload configuration:** `Prefix + r`
- **Pane navigation:** `Prefix + h/j/k/l`
- **Horizontal split:** `Prefix + |`
- **Vertical split:** `Prefix + -`

## Plugins

Plugins are managed by [TPM](https://github.com/tmux-plugins/tpm). TPM and the Catppuccin theme are declared in the configuration. Plugin repositories live under `~/.config/tmux/plugins/` and are excluded from version control.

To install configured plugins, start tmux and press `Prefix + I (Install)`.

## Notes

The configuration has been tested with tmux 3.8. UI changes should be tested after reloading the configuration or starting a fresh tmux server.

## References

- [tmux configuration tutorial (YouTube)](https://www.youtube.com/watch?v=GH3kpsbbERo&t=250s) — The tutorial that inspired this configuration. Useful for understanding the original setup and revisiting the reasoning behind individual choices.
