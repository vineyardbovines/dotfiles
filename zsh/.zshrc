source $HOME/dotfiles/zsh/.exports

# history
HISTSIZE=50000
SAVEHIST=10000

eval "$(starship init zsh)"

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

source $HOME/dotfiles/zsh/.aliases

# open tmux
if [ -z "$TMUX" ]; then
    tmux attach || tmux new-session -s main
fi

# bun completions
[ -s "/Users/spencerpope/.bun/_bun" ] && source "/Users/spencerpope/.bun/_bun"
