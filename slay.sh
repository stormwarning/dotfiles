#!/usr/bin/env bash

###############################################################################
# ERROR: Let the user know if the script fails
###############################################################################

trap 'ret=$?; test $ret -ne 0 && printf "\n   \e[31m\033[0m  Formation failed  \e[31m\033[0m\n" >&2; exit $ret' EXIT

set -e

###############################################################################
# TWIRL: Check for required functions file
###############################################################################

if [ -e twirl.sh ]; then
	cd "$(dirname "${BASH_SOURCE[0]}")" \
		&& . "twirl.sh"
else
	printf "\n ⚠️  ./twirl.sh not found  💃🏾 First, you need to twirl on your haters\n"
	exit 1
fi

###############################################################################
# CHECK: Bash version
###############################################################################

check_bash_version

###############################################################################
# Get in Formation!          http://patorjk.com/software/taag/ ( font: Script )
###############################################################################

printf "
   _
  | |
  | |  __   ,_    _  _  _    __, _|_ 🍋  __   _  _
  |/  /  \_/  |  / |/ |/ |  /  |  |  |  /  \_/ |/ |
  |__/\__/    |_/  |  |  |_/\_/|_/|_/|_/\__/   |  |
  |\  ---------------------------------------------
  |/  Cause you slay           [for Bash 3.2 - 3.9]
╭───────────────────────────────────────────────────╮
│  Okay developers now let's get in ${bold}formation${normal}.      │
│───────────────────────────────────────────────────│
│  Safe to run multiple times on the same machine.  │
│  It ${green}installs${reset}, ${blue}upgrades${reset}, or ${yellow}skips${reset} packages based   │
│  on what is already installed on the machine.     │
╰───────────────────────────────────────────────────╯
   ${dim}$(get_os) $(get_os_version) ${normal} // ${dim}$BASH ${normal} // ${dim}$BASH_VERSION${reset}
"

###############################################################################
# CHECK: Internet
###############################################################################
chapter "Checking internet connection…"
check_internet_connection

###############################################################################
# PROMPT: Password
###############################################################################
chapter "Caching password…"
ask_for_sudo

###############################################################################
# PROMPT: SSH Key
###############################################################################
chapter 'Checking for SSH key…'
ssh_key_setup

###############################################################################
# INSTALL: Dependencies
###############################################################################
chapter "Installing Dependencies…"

# -----------------------------------------------------------------------------
# XCode
# @todo Fix check for existing xcode-select installation.
# -----------------------------------------------------------------------------
# if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
# 	test -d "${xpath}" && test -x "${xpath}" ; then
# 	print_success_muted "Xcode already installed. Skipping."
# else
# 	step "Installing Xcode…"
# 	xcode-select --install
# 	print_success "Xcode installed!"
# fi

# if [ ! -d "$HOME/.bin/" ]; then
# 	mkdir "$HOME/.bin"
# fi

# -----------------------------------------------------------------------------
# Bash-it
# -----------------------------------------------------------------------------
# if [ -d "$HOME/.bash_it" ]; then
# 	print_success_muted "Bash-it already installed. Skipping."
# else
# 	step "Installing Bash-it…"
# 	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
# 	~/.bash_it/install.sh --silent --no-modify-config
# 	print_success "Bash-it installed!"
# fi

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------
if ! [ -x "$(command -v brew)" ]; then
	step "Installing Homebrew…"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	export PATH="/usr/local/bin:$PATH"
	print_success "Homebrew installed!"
else
	print_success_muted "Homebrew already installed. Skipping."
fi

if brew list | grep -Fq brew-cask; then
	step "Uninstalling old Homebrew-Cask…"
	brew uninstall --force brew-cask
	print_success "Homebrew-Cask uninstalled!"
fi

# -----------------------------------------------------------------------------
# ZSH prompt
# -----------------------------------------------------------------------------
if ! [ -e ~/.zshrc ]; then
	step "Setting up ZSH prompt…"

	mkdir ~/.zfunctions
	ln -s ~/.dotfiles/zsh/prompt/pure.zsh ~/.zfunctions/prompt_pure_setup
	ln -s ~/.dotfiles/zsh/prompt/async.zsh ~/.zfunctions/async
	ln -s ~/.dotfiles/zsh/zshrc.zsh ~/.zshrc

	print_success "ZSH installed!"
else
    print_success_muted "ZSH already installed. Skipping."
fi

# -----------------------------------------------------------------------------
# FNM
# -----------------------------------------------------------------------------
if [ -x fnm ]; then
	step "Installing fnm…"
	brew install fnm
	# Use ZSH plugin to install NVM.
	# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.40.1/install.sh | bash
	# source ~/.dotfiles/zsh/zsh-nvm/zsh-nvm.plugin.zsh
	print_success "fnm installed!"
	step "Installing latest Node…"
	fnm install --lts
	# nvm use node
	# nvm run node --version
	nodev=$(node -v)
	print_success "Using Node $nodev!"
else
	print_success_muted "fnm/Node already installed. Skipping."
fi

###############################################################################
# INSTALL: brews
###############################################################################
if [ -e $cwd/swag/brews ]; then
	chapter "Installing Homebrew formulae…"

	for brew in $(<$cwd/swag/brews); do
		install_brews $brew
	done
fi

###############################################################################
# UPDATE: Homebrew
###############################################################################
chapter "Updating Homebrew formulae…"
brew update

###############################################################################
# INSTALL: casks
###############################################################################
if [ -e $cwd/swag/casks ]; then
	chapter "Installing apps via Homebrew…"


	for cask in $(<$cwd/swag/casks); do
	    install_application_via_brew $cask
	done
fi

###############################################################################
# INSTALL: Mac App Store Apps
###############################################################################
chapter "Installing apps from App Store…"
if [ -x mas ]; then

	print_warning "Please install mas-cli first: brew mas. Skipping."

	else

	if [ -e $cwd/swag/apps ]; then
		if mas_setup; then
			# Workaround for associative array in Bash 3
			# https://stackoverflow.com/questions/6047648/bash-4-associative-arrays-error-declare-a-invalid-option
			for app in $(<$cwd/swag/apps); do
				KEY="${app%%::*}"
				VALUE="${app##*::}"
				install_application_via_app_store $KEY $VALUE
			done
		else
			print_warning "Please signin to App Store first. Skipping."
		fi
	fi

fi

###############################################################################
# CLEAN: Homebrew files
###############################################################################
chapter "Cleaning up Homebrew files…"
brew cleanup 2> /dev/null

###############################################################################
# INSTALL: npm packages
###############################################################################
if [ -e $cwd/swag/npm ]; then
	chapter "Installing npm packages…"

	for pkg in $(<$cwd/swag/npm); do
		KEY="${pkg%%::*}"
		VALUE="${pkg##*::}"
		install_npm_packages $KEY $VALUE
	done
fi


###############################################################################
# OPTIONAL: Customizations
###############################################################################
chapter "Adding hot sauce…"
if [ -e $cwd/hot-sauce ]; then
	if ask "Do you want to add hot sauce?" Y; then
		. "$cwd/hot-sauce"; printf "\n  You got hot sauce in your bag. 🔥 ${bold}Swag.${normal}\n";
	else
		print_success_muted "Hot sauce declined. Skipped.";
	fi
else
	print_warning "No ./hot-sauce found. Skipping."
fi

###############################################################################
# 🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋
###############################################################################
e_lemon_ated
