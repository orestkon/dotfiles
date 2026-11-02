# Language Toolchains

This document describes the installation, configuration, maintenance, and verification of language toolchains used in the development environment.

## Bun

Bun is installed independently of Homebrew using its official standalone installer.

### Installation

Install Bun using the official installation script:

```bash
curl -fsSL https://bun.sh/install | bash
```

The installer places Bun under `~/.bun`, with executables in `~/.bun/bin`.

### Environment and PATH

The `BUN_INSTALL` environment variable identifies the Bun installation directory.

Configuration in `.zprofile`:

```zsh
export BUN_INSTALL="$HOME/.bun"

path=(
  "$BUN_INSTALL/bin"
  "$HOME/.local/bin"
  $path
)
```

Zsh's `path` array automatically updates the `PATH` environment variable. `typeset -U path` prevents duplicate entries.

### Shell Completions

Bun completions are loaded through the existing `zsh/09_tools.zsh` configuration:

```zsh
# Load Bun shell completions if available
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
```

### Updates

Update Bun using its built-in upgrade command:

```bash
bun upgrade
```

### Verification

Verify the installation and executable locations:

```bash
command -v bun
command -v bunx
bun --version
bunx --version
```

Both executables should resolve to `~/.bun/bin`.

---

## Rust

Rust is installed and managed through [rustup](https://rustup.rs/), the official Rust toolchain manager.

### Installation

Install Rust using the official rustup installer:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
```
The `--no-modify-path` option prevents the installer from modifying shell startup files. PATH configuration is managed centrally by the dotfiles instead.
The Rustup installer may add a line sourcing `~/.cargo/env` to `.zshenv` if the `--no-modify-path` option is not applied.

The default installation provides the stable toolchain, including:

- `rustc` — Rust compiler
- `cargo` — package manager and build tool
- `clippy` — linter
- `rustfmt` — code formatter

Rustup stores its toolchains in `~/.rustup` and its executables and configuration in `~/.cargo`.

### Environment and PATH

The Cargo binary directory must be included in `PATH`.

Configuration in `.zprofile`:

```zsh
path=(
  "$BUN_INSTALL/bin"
  "$HOME/.cargo/bin"
  "$HOME/.local/bin"
  $path
)
```


### Toolchain Management

Update the active toolchain:

```bash
rustup update
```

Check installed toolchains:

```bash
rustup show
```

### Verification

Verify the installation and executable locations:

```bash
command -v rustup
command -v rustc
command -v cargo

rustup --version
rustc --version
cargo --version
rustup show
```

The executables should resolve to `~/.cargo/bin`, with the stable toolchain active by default.

## Go

*To be documented.*

## Python

*To be documented.*
