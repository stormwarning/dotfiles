#!/usr/bin/env bash

function doIt() {
  # symlink dotfiles to home directory
  rm -r ~/.bash_profile
  rm -r ~/.bashrc
  rm -r ~/.inputrc
  ln -s ~/.dotfiles/shell/bash_profile ~/.bash_profile
  ln -s ~/.dotfiles/shell/bashrc ~/.bashrc
  ln -s ~/.dotfiles/shell/inputrc ~/.inputrc

  rm -r ~/.gitconfig
  rm -r ~/.gitignore_global
  ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/git/gitignore ~/.gitignore_global

  ln -s ~/.dotfiles/conf/tmux.conf ~/.tmux.conf
  ln -s ~/.dotfiles/shell/tmp ~/.tmux/plugins/tpm

  source ~/.bashrc
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
