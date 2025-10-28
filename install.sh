#!/bin/bash

# helper function to suppress output with the exception of errors
quiet() {
    if ! "$@" > /dev/null 2>&1; then
        printf "\033[31mSomething went wrong, see below\033[0m\n"
        "$@"
    fi
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
    quiet eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# homebrew packages
printf "installing homebrew packages\n"
quiet brew bundle

# other apps
printf "installing app store apps\n"
APP_STORE_APPS=(
    1509590766 # mutekey
    1545870783 # system color picker
    1450874784 # transporter
    1502839586 # hand mirror
    1206020918 # battery indicator
    1558360383 # menu bar calendar
)
for app in "${APP_STORE_APPS[@]}"; do
    quiet mas install $app
done

# xcode
printf "setup xcode\n"
quiet xcodes install --latest --select --no-superuser --experimental-unxip

# macos
printf "configuring macos\n"
quiet ./macos/set-defaults.sh
quiet ./macos/set-login.sh

# bun
printf "installing bun\n"
quiet curl -fsSL https://bun.sh/install | bash

# ruby
printf "setup ruby\n"
echo "gem: --no-document" >> ~/.gemrc
quiet gem install bundler clocale colorls fastlane cocoapods

# vim
quiet curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
quiet mkdir -p ~/.vim/undo
quiet vim -E -s +PlugInstall +qall

# cursor
printf "setup cursor\n"
if [ -f "./cursor/extensions.txt" ]; then
  INSTALLED_EXTENSIONS=$(cursor --list-extensions)
  while read extension; do
    if ! echo "$INSTALLED_EXTENSIONS" | grep -q "^$extension$"; then
      cursor --install-extension "$extension"
    fi
  done < extensions.txt
fi
quiet cp -r ./cursor/settings.json ~/Library/Application\ Support/Cursor/User

# zplug
printf "setup zsh\n"
quiet curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# stow
printf "stowing dotfiles\n"
quiet stow wezterm colorls fzf git starship tmux vim z zsh

# reload
printf "setup zsh\n"
quiet source ~/.zshrc
