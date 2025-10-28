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
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix findutils)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-tar)/libexec/gnubin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"'

# ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

# python
export PYTHONIOENCODING='UTF-8'
export PYENV_SHELL=zsh
command pyenv rehash 2>/dev/null

# node
export PNPM_HOME=$HOME/.pnpm
export PATH=$PNPM_HOME:$PATH
export BUN_INSTALL=$HOME/bun
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
