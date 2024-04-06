# Intro
This is a repsoitory of my current config files for programs such as, neovim;
zsh; window's gvim; etc.

# How to Apply
## Brewfile
Currently, this `brewfile` does nothing automatic. It just serves as a place to
log installs.

## Install Nerd Fonts
Follow this
[guide](https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#option-2-homebrew-fonts).

```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```
After installing, restart Terminal.app. Update the Terminal.app preferences to
use the hack nerd font mono.

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

The tmux config can be applied using the below command from the repo's root
directory.

```
stow -t ~ tmux
```

The stow can be confirmed using the below command from the ~/ directory:

```
tree -a -l
```

Whenever a subfolder is added, the symlinks will be need to be removed and then
re-added.

Symlinks can be removed using this command:

```
stow -D -t ~ <folder>
```

# Links
- [tmux inspiration](https://www.youtube.com/watch?v=DzNmUNvnB04)
- [stow inspiration](https://www.youtube.com/watch?v=y6XCebnB9gs)
- [asdf inspiration](https://gorails.com/setup/macos/14-sonoma)
