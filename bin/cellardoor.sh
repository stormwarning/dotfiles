#!/usr/bin/env bash


# Make sure we’re using the latest Homebrew. ##########################
brew update


# Upgrade any already-installed formulae. #############################
brew upgrade --all


# Install Homebrew packages. ##########################################
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

brew install git
brew install gpg
brew install heroku
brew install hub
brew install imagemagick --with-webp
brew install jrnl
brew install mas
brew install node
brew install php56 --with-gmp
brew install php-code-sniffer # Remember to add wpcs to installed_paths
brew install pinentry-mac
brew install postgresql
brew install tmux
brew install reattach-to-user-namespace
brew install tree
brew install vim --with-override-system-vi
brew install wget
brew install wp-cli


# Install Python 2 & 3. ###############################################
brew install python
brew install python3
brew linkapps python
brew linkapps python3


# Install Bash 4. #####################################################
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell.
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/bash;
fi;


# Install Caskroom. ###################################################
brew tap caskroom/cask
brew tap caskroom/fonts


# Install Caskroom packages. ##########################################
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install alfred
brew cask install anvil
brew cask install appcleaner
brew cask install atom
brew cask install backblaze
brew cask install captain
brew cask install docker
brew cask install dropbox
brew cask install duet
brew cask install figma
brew cask install firefox
brew cask install flux
brew cask install fontprep
brew cask install google-chrome
# brew cask install google-drive
brew cask install google-nik-collection
brew cask install hyper
brew cask install imagealpha
brew cask install imageoptim
brew cask install insomnia
brew cask install iterm2
brew cask install keepingyouawake
brew cask install keybase
brew cask install ksdiff
brew cask install mamp
brew cask install noun-project
brew cask install now
brew cask install opera
brew cask install paparazzi
brew cask install rocket
brew cask install sketch
brew cask install sketchpacks
brew cask install skyfonts
brew cask install slack
brew cask install spectacle
brew cask install spotify
brew cask install sublime-text
brew cask install superduper
brew cask install tower
brew cask install transmission
brew cask install transmit
brew cask install vanilla
brew cask install visual-studio-code
brew cask install vlc
brew cask install webpack-dashboard

brew cask install font-fira-code
brew cask install font-mononoki

# Install Apple SF Mono here too.
cp -R /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/


# Remove outdated versions from the cellar. ###########################
brew cleanup


# Install apps from Mac App Store. ####################################
mas install 918858936  # Airmail 3
mas install 417602904  # CloudApp
mas install 411643860  # DaisyDisk
mas install 422304217  # Day One Classic
mas install 406056744  # Evernote
mas install 435003921  # Fantastical
mas install 671736912  # FruitJuice
mas install 775737590  # iA Writer
mas install 507257563  # Sip
mas install 1278508951 # Trello
mas install 557168941  # Tweetbot
mas install 494803304  # WiFi Explorer
