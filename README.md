# dotfiles

Dotfiles for my M3 Max Macbook Pro 15,9 running macOS Sequoia 15.x.

![zsh with starship prompt and colorls](https://user-images.githubusercontent.com/15176096/71632895-ff0d0980-2bde-11ea-966f-65e5d564361f.png)
![vim and tmux](https://user-images.githubusercontent.com/15176096/71633424-2f09dc00-2be2-11ea-9c15-a4f492b7ea68.png)

- Terminal: [Alacritty](https://github.com/jwilm/alacritty) using zsh w/ [starship prompt](https://starship.rs/) and [color-ls](https://github.com/athityakumar/colorls)
- Vim: [neovim](https://neovim.io/) with [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins
- Tools: [tmux](https://github.com/tmux/tmux), [z](https://github.com/rupa/z), [fzf](https://github.com/junegunn/fzf)

## Installation

**Before you get started** make sure you give full disk access permission to your terminal (for writing macos defaults). `System Preferences -> Privacy -> Full Disk Access`.

To install:

`curl -L https://git.io/JeA7g | sh`

This expands to [run.sh](https://github.com/gretzky/dotfiles/blob/master/run.sh) which will fetch this repo and run the install script.

## File overview

- Configs for the following tools:
  - [Alacritty](./alacritty)
  - [colorls](./colorls)
  - [fzf](./fzf)
  - [git](./git)
  - [macos](./macos)
  - [starship](./starship)
  - [tmux](./tmux)
  - [vim](./vim)
  - [z](./z)
- Shell environment configs:
  - [zplug](https://github.com/zplug/zplug) for zsh plugin management
  - [`.zshrc`](./zsh/.zshrc)
  - [`.zlogin.sh`](./zsh/.zlogin.sh)
  - [`.zshenv.sh`](./zsh/.zshenv.sh)
  - [`.aliases`](./zsh/.aliases)
  - [`.exports`](./zsh/.exports)
- [`Brewfile`](./Brewfile) - contains all homebrew packages and casks
- [Cursor settings and extensions](./cursor)

### Programming languages

- Ruby using homebrew
- Python with [pyenv](https://github.com/pyenv/pyenv) 
- Node with [n](https://github.com/tj/n)

### Customization

- Be sure to update the user name/email values in the global [gitconfig](./git/.gitconfig)
- Color scheme is [Ayu Mirage](https://github.com/dempfi/ayu)

## Acknowledgements

- [huyvohcmc/dotfiles](https://github.com/huyvohcmc/dotfiles)
- [alrra/dotfiles](https://github.com/alrra/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
