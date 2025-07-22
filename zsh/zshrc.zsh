# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Case-insensitive tab-completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# https://github.com/zsh-users/zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/zsh-users/zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters


fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure


# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/shell/{aliases,exports,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

source ~/.dotfiles/zsh/input

# Add Homebrew's sbin to PATH.
export PATH="/usr/local/sbin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Automatic fnm version switching.
# https://github.com/Schniz/fnm?tab=readme-ov-file#zsh)
eval "$(fnm env --use-on-cd --shell zsh)"

# https://github.com/lukechilds/zsh-nvm
# export NVM_AUTO_USE=true
# source ~/.dotfiles/zsh/zsh-nvm/zsh-nvm.plugin.zsh

# Add Webstorm CLI launcher to PATH.
export PATH="$PATH:/Applications/WebStorm.app/Contents/MacOS"

# The next line updates PATH for Netlify's Git Credential Helper.
test -f '~/Library/Preferences/netlify/helper/path.zsh.inc' && source '~/Library/Preferences/netlify/helper/path.zsh.inc'

# Okta + AWS-CLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Add Cargo to PATH.
export PATH="$HOME/.cargo/bin:$PATH"
