#!/bin/zsh

PATH=$PATH:/opt/homebrew/bin
export PATH="$HOME/.local/bin:$PATH"

# prefer US English & utf-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# avoid issues with `gpg` from homebrew
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# plugins
source ~/.zplug/init.zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/bun", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/starship", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "djui/alias-tips"
zplug "vineyardbovines/auto-color-ls"
zplug load

autoload -U compinit
compinit

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source $HOME/zsh/exports.zsh
source $HOME/zsh/alias.zsh
