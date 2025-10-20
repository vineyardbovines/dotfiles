#!/bin/sh

# set language
if [[ -z "$LANG" ]]; then
    eval "$(locale)"
fi

# set editors
export VISUAL=nvim
export EDITOR="$VISUAL"
# handle less
export PAGER="less"
# set default less options
export LESS="-F -g -i -M -R -S -w -X -z-4"
# set less preprocessor
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# ruby
export RUBIES=(~/.rubies/*)
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# auto-switch ruby versions
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# set the list of dirs that zsh searches for programs
path=(
    /usr/local/{bin,sbin}
    /usr/{bin,sbin}
    /{bin,sbin}
    $path
)
for path_file in /etc/paths.d/*(.N); do
    path+=($(<$path_file))
done
unset path_file

# temp files
if [[ -d "$TMPDIR" ]]; then
    export TMPPREFIX="${TMPDIR%/}/zsh"
    if [[ ! -d "$TMPPREFIX" ]]; then
        mkdir -p "$TMPPREFIX"
    fi
fi
