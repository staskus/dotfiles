#!/bin/zsh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Link files
files="bin .vim .vimrc .custom .gitattributes .gitconfig .gitignore .hgignore .hgrc .inputrc .pythonrc"
echo "\nLinking files..."
for file in $files; do
    echo "  Linking $file to ~"
    rm -rf ~/$file
    ln -s $DIR/$file ~/$file
done

# zshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

rm -rf ~/.zshrc ~/.zpreztorc
ln -s $DIR/zprezto/zshrc ~/.zshrc
ln -s $DIR/zprezto/zpreztorc ~/.zpreztorc

# brew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

mkdir -p ~/Library/LaunchAgents

# Casks
brew cask install java
brew cask install dropbox
brew cask install 1password
brew cask install genymotion
brew cask install iterm2
brew cask install rocket-chat
brew cask install sourcetree
brew cask install google-chrome
brew cask install diffmerge
brew cask install the-unarchiver
brew cask install vlc
brew cask install virtualbox 
brew cask install spotify
brew cask install sketch
brew cask install android-studio appcode
brew cask install atom
brew cask install colorsnapper
brew cask install deco
brew cask install docker
brew cask install skype

brew install coreutils findutils

brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
    carthage
    macvim
    moreutils
    grep
    imagemagick
    jpeg
    elasticsearch
    node
    readline
    wget
    autoconf
    cmake
    openssl
    nginx
    carthage
)

brew install ${binaries[@]}
brew cleanup

# npm
npm install -g diff-so-fancy

# cocoapods
gem install cocoapods