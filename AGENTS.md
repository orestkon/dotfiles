# AGENTS.md

Personal dotfiles for macOS, with a cross-platform installer. There is no build
system, test suite, CI, or formatter.

## Repository model

Each top-level directory is a GNU Stow package that mirrors `$HOME`:

| Package      | Installs to                                              |
| ------------ | -------------------------------------------------------- |
| `zsh/`       | `~/.zshrc`, `~/.zshenv`, `~/.zprofile`, `~/.config/zsh/` |
| `nvim/`      | `~/.config/nvim/`                                        |
| `tmux/`      | `~/.config/tmux/`                                        |
| `yazi/`      | `~/.config/yazi/`                                        |
| `ghostty/`   | `~/.config/ghostty/`                                     |
| `fastfetch/` | `~/.config/fastfetch/`                                   |
| `ohmyposh/`  | `~/.config/ohmyposh/`                                    |
| `opencode/`  | `~/.config/opencode/`                                    |

- Root files and `scripts/` are never stowed.
- `.stow-ignore` is read by the installer, not by GNU Stow.
- Add a dotfile inside the package that owns the tool. Add a top-level package
  only for a new tool.

## Installers and scripts

- Goal: one cross-platform installer supporting macOS, Ubuntu/Debian, Fedora,
  Arch, and WSL.
- Keep exactly one documented entry point. `scripts/` holds helpers and is never
  stowed.
- The installer discovers top-level directories and skips entries listed in
  `.stow-ignore`; do not hardcode package names in it.
- Installers must be idempotent and safe to re-run. Never delete or overwrite
  existing user configuration.
- Keep macOS-only logic (`macosSettings.sh`) behind an OS guard.
- Do not add new `curl | sh` steps without asking.
- When adding a tool, update the README package list and `.stow-ignore` if the
  directory is not a package.

## Hard rules

- Never run `scripts/install.sh` or `scripts/macosSettings.sh` unless explicitly
  asked. They install software, use `sudo`/`curl`, change macOS defaults, and
  kill Dock/Finder.
- Do not run `stow`, `stow --adopt`, or `stow -D` unless explicitly asked; they
  write into `$HOME` and can overwrite real files. A dry run (`stow -n <pkg>`)
  is fine.
- Work only inside this repository. The global OpenCode config denies access to
  external directories; do not try to work around it.
- Never commit secrets: API keys, tokens, private keys, or `.env` contents. Use
  `{file:~/...}` or `{env:...}` references; real secrets live in `~/.secrets`.
- Never modify vendored code: `nvim/.config/nvim/lua/kickstart/`,
  `tmux/.config/tmux/plugins/`, `yazi/.config/yazi/flavors/`.
- Never commit tmux plugins, yazi flavors, or `node_modules`.
- Do not commit, amend, push, tag, or rebase unless asked. Stage only files
  relevant to the request.
- Do not add dependencies, plugin managers, or new tools without asking.

## Editing conventions

- Match the style of the file you touch; do not reformat or reorder unrelated
  lines.
- Keep diffs minimal and scoped. Prefer editing an existing file over creating
  one.
- Lua uses 2 spaces and no tabs (`expandtab`, `tabstop`/`shiftwidth` 2). Zsh and
  tmux files use 2 spaces.
- Use `$HOME` and XDG paths, never a hardcoded `/Users/<name>`.
- Scripts are non-interactive: do not rely on aliases (`ls`→eza, `cat`→bat,
  `rm -i`, `cd`→zoxide). Use `command` or absolute paths.
- Catppuccin Macchiato is the default theme; deviate only for a deliberate
  reason.
- Keep zsh startup fast; no blocking network calls or heavy commands beyond the
  existing prompt and fastfetch setup.

## Per-area notes

- **Zsh:** `~/.zshrc` sources `~/.config/zsh/NN_*.zsh` in numeric order. Add new
  concerns as the next number; do not renumber or merge modules. Aliases live in
  `05_aliases.zsh`.
- **Nvim:** lazy.nvim. Kickstart-derived modules stay in `lua/plugins/`; personal
  additions go in `lua/custom/plugins/`. Leader is `<Space>`.
  `lazy-lock.json` is tracked; commit it when plugin versions change.
- **Tmux:** prefix is `C-a`. `tmux.conf` sources `bindings.conf` and
  `catppuccin.conf`. Plugins are TPM-managed, never vendored.
- **Yazi:** the flavor is pinned in `package.toml`; never edit the flavor
  directory.
- **OpenCode:** `opencode.json` is the V2 server config (`default_agent: plan`,
  DeepSeek key via `{file:}`, deliberately strict permissions). `cli.json` holds
  CLI-only UI and keybind settings. Do not loosen permissions or replace the key
  reference.
- **Ghostty / Fastfetch / Oh My Posh:** declarative data files; keep them simple.

## Commits

Format: `Area: Description`

- Areas: `Nvim`, `Zsh`, `Tmux`, `Yazi`, `Ghostty`, `Fastfetch`, `OpenCode`; use
  `Config` for cross-cutting or repo-level changes.
- Sentence case after the colon, imperative or short noun phrase, no trailing
  period, no `feat:`/`fix:` prefixes, no emoji.
- One logical change per commit; add a body only when the "why" is not obvious.
- Examples: `Nvim: Extract telescope.nvim`,
  `Config: Clean up OpenCode, zsh secrets, and gitignore`.

## Verification

No automated tests. Validate what you changed and report what you ran:

- JSON: `jq empty <file>` (for example
  `opencode/.config/opencode/opencode.json`,
  `opencode/.config/opencode/cli.json`,
  `fastfetch/.config/fastfetch/config.jsonc`)
- Shell: `bash -n scripts/*.sh` and
  `zsh -n zsh/.zshrc zsh/.zshenv zsh/.zprofile zsh/.config/zsh/*.zsh`
- Lua: `luac -p <changed-file>`
- TOML: `python3 -c 'import tomllib,sys; tomllib.load(open(sys.argv[1],"rb"))' <file>`
  (Python 3.11+; on this machine use `python3.14`)
- Whitespace: `git diff --check`
- OpenCode: `opencode debug config` after changing `opencode.json`
- Do not run `install.sh`, restart shells, reload tmux/nvim, or change system
  settings as a test.
- If a check cannot be run, say so instead of claiming success.

## Documentation

- `README.md` is the single install entry point; keep it in sync with the
  installer and the current package list.
- Per-tool READMEs (`nvim/`, `tmux/`) describe structure and usage; update them
  when behavior changes.
- `AGENTS.md` is agent guidance only; user-facing instructions belong in READMEs.
