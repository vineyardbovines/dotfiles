export PATH="/usr/local/sbin:$PATH"
export EDITOR=nvim

# history
HISTSIZE=50000
SAVEHIST=10000

eval "$(starship init zsh)"

source ~/.zplug/init.zsh

zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/bun", from:oh-my-zsh
zplug "plugins/chruby", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/git-auto-fetch", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/starship", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "djui/alias-tips"
zplug "vineyardbovines/auto-color-ls"

zplug load

source $HOME/dotfiles/zsh/.aliases

###
# exports
###

# add ~/bin to path
PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH
PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
PATH=/opt/local/bin:/opt/local/sbin:"$PATH"

# prefer US English & utf-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# brew
PATH=$PATH:/opt/homebrew/bin

# configure ruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8'

# npm global
export NPM_PACKAGES="/usr/local/npm_packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"'

# z
. ~/z.sh

# depot tools
export PATH=$PATH:$HOME/depot_tools

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

# linux utils
export PATH="/usr/local/opt/util-linux/bin:$PATH"
export PATH="/usr/local/opt/util-linux/sbin:$PATH"

# pyenv
export PYENV_SHELL=zsh
command pyenv rehash 2>/dev/null

# pnpm
export PNPM_HOME=$HOME/Library/pnpm
export PATH=$PNPM_HOME:$PATH

# direnv
eval "$(direnv hook zsh)"

# bun completions
[ -s "/Users/pope/.bun/_bun" ] && source "/Users/pope/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ruby
export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/bin:$PATH"
