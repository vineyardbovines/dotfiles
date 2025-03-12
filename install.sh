##!/bin/bash

# helper function to suppress output
# with the exception of errors
quiet() {
    if ! "$@" > /dev/null 2>&1; then
        printf "\033[31mSomething went wrong, see below\033[0m\n"
        "$@"
    fi
}

###
# 0. get sudo password to use throughout the script
printf "your password is required\n"
sleep 1
sudo -v
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

###
# 1. xcode command line tools
###
printf "installing xcode cli tools\n"
quiet xcode-select --install

###
# 2. homebrew
###
if ! command -v "brew" &>/dev/null; then
    printf "installing homebrew\n"
    # install homebrew
    quiet /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # set it in the terminal
    quiet eval "$(/opt/homebrew/bin/brew shellenv)"
fi

###
# 3. xcode
###
printf "setup xcode\n"
quiet brew install --cask xcodes
quiet xcodes install --latest --no-superuser
quiet sudo xcode-select -switch /Applications/Xcode.app
quiet sudo xcodebuild -license accept

###
# 4. macos
###
printf "configure macos\n"
./macos/.macos

###
# 4. install homebrew tools
###
printf "installing packages from brewfile\n"
quiet brew bundle

###
# 5. installing app store apps
###
printf "installing app store apps\n"
quiet mas install 1509590766 # mutekey
quiet mas install 1545870783 # system color picker
quiet mas install 1450874784 # transporter
quiet mas install 1569813296 # 1password safari extension
quiet mas install 1502839586 # hand mirror
quiet mas install 1206020918 # battery indicator
quiet mas install 1558360383 # menu bar calendar

###
# 6. ruby
###
printf "setup ruby\n"
quiet source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
echo "gem: --no-document" >> ~/.gemrc
quiet ruby-install ruby
# find the latest ruby version
RUBY_DIRS=(~/.rubies/ruby-*)
LATEST_RUBY="${RUBY_DIRS[${#RUBY_DIRS[@]}-1]}"
LATEST_RUBY_VERSION=$(basename "$LATEST_RUBY" | sed 's/ruby-//')
quiet chruby $LATEST_RUBY_VERSION
quiet echo "ruby-$LATEST_RUBY_VERSION" > ~/.ruby-version
quiet gem update --system
quiet gem install bundler
quiet gem install clocale colorls

###
# 7. node
###
printf "setup node\n"
quiet npm install -g npm
quiet sudo mkdir -p /usr/local/n
quiet sudo chown -R $(whoami) /usr/local/n
quiet sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
quiet n lts
printf "installing pnpm\n"
quiet curl -fsSL https://get.pnpm.io/install.sh | sh -
printf "installing bun\n"
quiet curl -fsSL https://bun.sh/install | bash

###
# 8. rust
###
printf "setup rust\n"
quiet curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

###
# 9. vim
###
printf "setup vim\n"
quiet curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
quiet mkdir -p ~/.vim/undo
quiet vim -E -s +PlugInstall +qall

###
# 10. zplug
###
printf "setup zsh\n"
quiet curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

###
# 11. starship
###
printf "install starship prompt\n"
quiet curl -sS https://starship.rs/install.sh | sh

###
# 12. cursor
###
printf "setup cursor\n"
if [ -f "extensions.txt" ]; then
  INSTALLED_EXTENSIONS=$(cursor --list-extensions)
  while read extension; do
    if ! echo "$INSTALLED_EXTENSIONS" | grep -q "^$extension$"; then
      cursor --install-extension "$extension"
    fi
  done < extensions.txt
fi
quiet cp -r ./cursor/settings.json ~/Library/Application\ Support/Cursor/User

###
# 12. stow
###
printf "stowing dotfiles\n"
quiet stow alacritty colorls fzf git starship tmux vim z zsh

###
# 13. zsh
###
printf "setup zsh\n"
quiet source ~/.zshrc
