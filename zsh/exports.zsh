#!/bin/bash

# brew
PATH=$PATH:/opt/homebrew/bin

# prefer US English & utf-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# avoid issues with `gpg` from homebrew
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# use gnu versions of tools
for gnu in coreutils findutils gnu-sed gnu-tar gnu-time gnu-which grep gawk; do
  PATH="/opt/homebrew/opt/$gnu/libexec/gnubin:$PATH"
done
export PATH="/opt/homebrew/opt/diffutils/bin:$PATH"
export PATH="/opt/homebrew/opt/gzip/bin:$PATH"

# fzf with ripgrep
source <(fzf --zsh)
export RIPGREP_CONFIG_PATH=$HOME/.rgrc
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"'

# python
export PYTHONIOENCODING='UTF-8'
export PYENV_SHELL=zsh
command pyenv rehash 2>/dev/null

# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"

# node
export PNPM_HOME=$HOME/.pnpm
export PATH=$PNPM_HOME:$PATH
export BUN_INSTALL=$HOME/bun
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# f
eval "$(pay-respects zsh --alias)"
