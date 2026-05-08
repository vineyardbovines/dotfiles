#!/bin/bash

##
# laziness and shortcuts
##
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
