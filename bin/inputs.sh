#!/usr/bin/env zsh


configure_inputs() {
	## KEYBOARD ##########################################################
	######################################################################

	# Enable moving focus with Tab and Shift Tab.
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

	# Disable press-and-hold for keys in favor of key repeat.
	# Requires a restart.
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

	# Set a blazingly fast keyboard repeat rate.
	defaults write NSGlobalDomain KeyRepeat -int 1
	defaults write NSGlobalDomain InitialKeyRepeat -int 10

	# Ensure KeyRepeat changes take effect immediately.
	/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

	# Open Character Viewer with Fn key.
	# Requires a restart.
	defaults write com.apple.HIToolbox AppleFnUsageType -int 2

	# Disable automatic capitalization.
	defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

	# Disable smart dashes as they’re annoying when typing code.
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

	# Disable automatic period substitution.
	defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

	# Disable smart quotes as they’re annoying when typing code.
	# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

	# Disable auto-correct.
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
}
