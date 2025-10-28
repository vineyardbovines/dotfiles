#!/bin/bash

# terminal-specific shortcuts

# git laziness
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gb="git branch"
alias gm="git merge"
alias gmc="git merge --continue"
alias gma="git merge --abort"
alias gpl="git pull"
alias gp="git push"
alias gcl="git clone"
alias gch="git checkout"
alias gc="git commit -am"
alias gchp="git cherry-pick"
alias gst="git stash"
alias gsa="git stash apply"
alias gsd="git stash drop"
alias gd="git diff"
alias gra="git remote add"

# open merge conflicts in cursor
alias gitfix="git diff --name-only | uniq | xargs cursor"

# clean local branches
alias gitclean="git branch -d `git branch --merged | grep -v '^*' | grep -v 'master' | tr -d '\n'`"

# copy branch name to clipboard
alias gitcpb="git rev-parse --abbrev-ref HEAD | tr -d '\n' | tr -d ' ' | pbcopy"

# generate gitignore
alias gitignore="curl -L -s https://www.gitignore.io/api/$@"
alias gi="gitignore"

# nuke a branch locally and on remote
alias gitnuke="git branch -D $1 && git push origin :$1"

# rename a branch and update it
alias gitrename="git branch -m $1 $2 && git push origin :$1 $2 && git push origin -u $2"

# setup a branch to track a remote branch
alias gittrack="git branch $1 --set-upstream-to origin/$1"

# show diff of unpushed changes
alias gitunpushed="git diff origin/$(git rev-parse --abbrev-ref HEAD)..HEAD"


# g-prefixed gnu tools
alias time="gtime"
alias which="gwhich"
alias diff="gdiff"
alias size="gsize"
alias strings="gstrings" # lol
alias cat="ccat"

# better ls
alias ls="echo; colorls -A --group-directories-first"

# laziness
alias md="mkdir -p"
alias t="touch"
alias x="exit"
alias c="clear"
alias o="open ."
alias restart="sudo reboot"
alias bye="sudo shutdown -r now"
alias get="curl -O -L"
alias reload="source ~/.zshrc"

take() {
    mkdir -p $1
    cd $1
}
alias tk="take"

# go back X number of directories
up() {
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname) "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "🛂  Arg must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "a POSITIVE number"
    else
        for i in {1..${1}}; do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# lock screen when going afk
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# mute
alias stfu="osascript -e 'set volume output muted true'"

# remove cached xcode build data
alias xcodepurge="rm -rf ~/Library/Developer/Xcode/DerivedData"
