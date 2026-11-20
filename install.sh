#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

export PATH="$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# make dirs
mkdir -p \
    "$HOME/.local/bin" \
    "$HOME/.config" \
    "$HOME/dev" \
    "$HOME/Desktop/screenshots/simulator"

# xcode cli tools
if ! xcode-select -p >/dev/null 2>&1; then
    printf "installing xcode cli tools\n"
    xcode-select --install
    exit 0
fi

# install and setup mise
if ! command -v mise >/dev/null 2>&1; then
    installer="$(mktemp)"
    curl -fsSL https://mise.run -o "$installer"
    MISE_INSTALL_PATH="$HOME/.local/bin/mise" /bin/sh "$installer"
    rm "$installer"
fi
mkdir -p "$HOME/.config/mise"
cp .config/mise/config.toml "$HOME/.config/mise/config.toml"

# install packages
mise bootstrap --only packages

# link dotfiles
stow --no-folding --ignore='^mise$' --target="$HOME/.config" .config
stow --no-folding --target="$HOME" git tmux zsh

# finish xcode setup
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

# apply rest of mise config
mise --cd "$HOME" bootstrap --skip packages,repos

# zplug
git clone https://github.com/zplug/zplug.git "$HOME/.zplug"
zsh -ic 'zplug check || zplug install'

# neovim
mise --cd "$HOME" exec -- nvim --headless '+PlugInstall --sync' +qa

# reload
exec zsh -l

printf "done\n"
