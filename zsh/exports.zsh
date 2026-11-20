#!/bin/bash

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Prefer US English & UTF-8
export LANG="en_US.UTF-8"

# Homebrew GPG
[[ -t 0 ]] && export GPG_TTY="$(tty)"

# Prefer GNU tools
for gnu in coreutils findutils gnu-sed gnu-tar gnu-time gnu-which grep gawk; do
  export PATH="/opt/homebrew/opt/$gnu/libexec/gnubin:$PATH"
done
unset gnu

export PATH="/opt/homebrew/opt/diffutils/bin:$PATH"
export PATH="/opt/homebrew/opt/gzip/bin:$PATH"

# fzf with ripgrep
source <(fzf --zsh)
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"'

# Python
export PYTHONIOENCODING="UTF-8"
