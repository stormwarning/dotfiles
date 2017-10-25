#!/usr/bin/env bash


# Install Zsh. ########################################################
brew install zsh
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Switch to zsh as default shell.
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
    echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/zsh;
fi;

# Install Pure prompt. ################################################
mkdir ~/.zfunctions
ln -s ~/.dotfiles/zsh/prompt/pure.zsh ~/.zfunctions/prompt_pure_setup
ln -s ~/.dotfiles/zsh/prompt/async.zsh ~/.zfunctions/async

ln -s ~/.dotfiles/zsh/zshrc.zsh ~/.zshrc
