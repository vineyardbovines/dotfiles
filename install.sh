#!/bin/bash

cd "$(dirname "$0")" || exit

# helper function to suppress output with the exception of errors
quiet() {
    if ! "$@" > /dev/null 2>&1; then
        printf "\033[31mSomething went wrong, see below\033[0m\n"
        "$@"
    fi
}

# append a line to a file if it doesn't already exist
append_once() {
    grep -qxF "$1" "$2" 2>/dev/null || echo "$1" >> "$2"
}

# get sudo password for the lifetime of the script
printf "your password is required\n"
sleep 1
sudo -v
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# xcode cli tools
printf "installing xcode cli tools\n"
quiet xcode-select --install

# homebrew check
if ! command -v "brew" &>/dev/null; then
    printf "installing homebrew\n"
    # install homebrew
    quiet /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # set it in the terminal
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# homebrew packages
printf "installing homebrew packages\n"
quiet brew bundle

# app store apps
printf "installing app store apps\n"
APPSTORE_APPS=(
    1037126344 # Apple Configurator
    1450874784 # Transporter
)
for app in "${APPSTORE_APPS[@]}"; do
    quiet mas install $app
done

# xcode
printf "setup xcode\n"
quiet xcodes install --latest --select --no-superuser --experimental-unxip

# ruby
printf "setup ruby\n"
append_once "gem: --no-document" ~/.gemrc
quiet gem install bundler clocale colorls fastlane cocoapods

# bun
printf "installing bun\n"
quiet curl -fsSL https://bun.sh/install | bash

# stow configs
stow .config git tmux zsh

# setup vim
quiet nvim -E -s +PlugInstall +qall

# setup macos
./macos/set-defaults.sh
./macos/set-login.sh

# setup directories
mkdir -p ~/dev ~/Desktop/screenshots
# setup claude
touch ~/dev/.envrc
append_once "export CLAUDE_CONFIG_DIR=\"$HOME/dev/.claude\"" ~/dev/.envrc
cp -rn .claude ~/dev/.claude

# setup zsh
source ~/.zshrc
