##!/bin/bash

quiet() {
    "$@" > /dev/null 2>&1
}

#get sudo password
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

#xcode-select
printf "Checking xcode-select\n"
quiet xcode-select --install

#homebrew
if ! command -v "brew" &>/dev/null; then
    printf "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    quiet eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#xcode
printf "Installing Xcode\n"
quiet brew install xcodesorg/made/xcodes
quiet xcodes install --latest --no-superuser
quiet sudo xcode-select -switch /Applications/Xcode.app
quiet sudo xcodebuild -license accept

#homebrew packages
printf "Installing Homebrew packages\n"
quiet brew bundle

#app store
printf "Installing App Store apps\n"
quiet mas install 1509590766 Mutekey
quiet mas install 1545870783 System Color Picker
quiet mas install 1450874784 Transporter

#ruby
printf "Installing Ruby\n"
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
echo "gem: --no-document" >> ~/.gemrc
quiet gem update --system
quiet gem install bundler
quiet gem install clocale colorls

#node / npm
printf "Installing Node and n"
quiet npm install -g n
quiet sudo mkdir -p /usr/local/n
quiet sudo chown -R $(whoami) /usr/local/n
quiet sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
quiet n lts

#pnpm
printf "Installing pnpm\n"
quiet curl -fsSL https://get.pnpm.io/install.sh | sh -

#bun
printf "Installing bun\n"
quiet curl -fsSL https://bun.sh/install | bash

#rust
printf "Installing rust\n"
quiet curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#vim
printf "Installing vim plugins\n"
quiet url -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#zplug
printf "Installing zplug\n"
quiet curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

#starship
printf "Installing starship\n"
quiet curl -sS https://starship.rs/install.sh | sh

#stow
printf "Stowing dotfiles\n"
quiet stow alacritty colorls fzf git nvim skhd starship tmux vim yabai z zsh
