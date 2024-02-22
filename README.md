# Intro
This is a repsoitory of my current config files for programs such as, neovim;
zsh; window's gvim; etc.

# How to Apply
## Brewfile
Currently, this `brewfile` does nothing automatic. It just serves as a place to
log installs.

## Stow files
The neomvim and zsh configs are maintained through GNU stow. Once stow is
installed through homebrew and oh my zsh is installed manually (see
[repo](https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#basic-installation).
The neovim config can be applied using the below command from the repo's root
directory.

```
stow -t ~ nvim
```

The zsh config can be applied using the below command from the repo's root
directory.

```
stow -t ~ zsh
```

The stow can be confirmed using the below command from the ~/ directory:

```
tree -a -l
```

Symlinks can be removed using this command:

```
stow -D -t ~ <folder>
```
