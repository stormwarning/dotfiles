#!/usr/bin/env bash


# Install Node Version Manager. #######################################
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
command -v nvm


# Install primary Node version. #######################################
nvm install 8


# Ensure npm uses corrrect Python version. ############################
# See: https://github.com/nodejs/node-gyp/issues/746#issuecomment-281911560
npm config set python python2.7

# Sign git tags with GPG key.
npm config set sign-git-tag true


# Upgrade any already-installed modules. ##############################
npm update -g


# Install Node modules. ###############################################
npm install -g avn avn-n avn-nvm
avn setup

npm install -g bs
npm install -g eslint
npm install -g gulp
npm install -g now
npm install -g np
npm install -g release
npm install -g stylelint
npm install -g vsce
npm install -g yo

npm install -g alfred-emoj




# Install other Node versions. ########################################
nvm install 0.10 --reinstall-packages-from=8
nvm install 4 --reinstall-packages-from=8
nvm install 6 --reinstall-packages-from=8
