# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/orestkon/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks for the config packages

```
$ stow fastfetch ghostty nvim ohmyposh opencode tmux yazi zsh
```

The `scripts/` directory contains setup helpers and is not stowed.

## More information

Check out [this YouTube video](https://www.youtube.com/watch?v=y6XCebnB9gs).
