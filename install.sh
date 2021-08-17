
# ohmyz.sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# nano ~/.zshrc find plugins=(git)
## Append zsh-autosuggestions & zsh-syntax-highlighting to plugins() like this
## plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# brew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Casks
brew install --cask 1password
brew install --cask iterm2
brew install --cask sourcetree
brew install --cask spotify
brew install --cask sublime-text
brew install --cask thunderbird
brew install --cask google-chrome
brew install --cask dropbox
brew install --cask spectacle


brew install coreutils findutils

brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
    grep
    node
    cmake
    openssl
)

brew install ${binaries[@]}
brew cleanup

# npm
npm install -g diff-so-fancy

# cocoapods
sudo gem install cocoapods