echo "Welcome Yasir!"
echo "It's time to setup your new mac."

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '-'
echo "Checking for Oh My Zsh and install if we don't have it"
if test ! $(which omz); then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "OMZ is installed"
fi

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '-'
echo "Check for Homebrew and install if we don't have it"
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '-'
echo "Initiating brew packages installation - might require prompt/sudo authorization"
# brews 
brew install gh
brew install exiftool
brew install apache-spark
brew install git
brew install gradle
brew install sqlite

brew install --cask visual-studio-code
brew install --cask miniconda
brew install --cask google-chrome
brew install --cask notion
brew install --cask alt-tab
brew install --cask ngrok
brew install --cask temurin@8
brew install --cask warp
brew install --cask obs
brew install --cask chatgpt
brew install --cask zoom
brew install --cask microsoft-teams
brew install --cask citrix-workspace
brew install --cask dbeaver-community

echo "Brew packages installation finished"

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '-'
echo "Setting up mac defaults of your choice"

echo "- Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "- Screencapture: Save screenshots to the desktop"
mkdir -p "$HOME/screenshots"
defaults write com.apple.screencapture location -string "$HOME/screenshots"

echo "- Screencapture: Save screenshots in PNG format"
defaults write com.apple.screencapture type -string "png"

echo "- Dock: keep smooth animation time, but remove delay"
defaults write com.apple.dock autohide-delay -float 0; killall Dock

echo "Mac defaults updated"

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '-'