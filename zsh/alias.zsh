#!/bin/bash

##
# laziness and shortcuts
##
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

alias cp="cp -i"
alias mv="mv -i"
alias sudo="sudo -H"
alias ls="echo; colorls -A --group-directories-first"
alias gre="grep -H -n -I --color=auto"
alias md="mkdir -p"
alias t="touch"
alias x="exit"
alias c="clear"
alias o="open ."
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias zzz="sudo shutdown -s now"
alias bye="sudo shutdown -h now"
alias restart="sudo shutdown -r now"
alias get="curl -O -L"
alias reload="exec zsh"
alias size="gsize"
alias strings="gstrings" # lol
alias cat="bat --plain --paging=never"
alias ls="echo; colorls -A --group-directories-first"
alias time="gtime"
alias which="gwhich"
alias diff="gdiff"
alias size="gsize"
alias strings="gstrings" # lol
alias cat="ccat"

# remove cached xcode build data
alias xcodepurge="rm -rf ~/Library/Developer/Xcode/DerivedData"

# create a directory and cd into it
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

# find and kill a process on a given port
killport() {
    # SIGTERM first
    lsof -ti tcp:"$1" | xargs kill
    sleep 1
    # SIGKILL stragglers
    lsof -ti tcp:"$1" | xargs kill -9 2>/dev/null
}

# lock screen when going afk
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# mute
alias stfu="osascript -e 'set volume output muted true'"
