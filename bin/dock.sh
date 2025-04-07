#!/usr/bin/env zsh


configure_dock() {
	# Only show active apps.
	defaults write com.apple.dock "static-only" -bool true

	# Enable highlight hover effect for the grid view of a stack (Dock).
	defaults write com.apple.dock mouse-over-hilite-stack -bool true

	# Set the icon size of Dock items to 32 pixels.
	defaults write com.apple.dock tilesize -int 32

	# Change minimize/maximize window effect.
	defaults write com.apple.dock mineffect -string "scale"

	# Minimize windows into their application’s icon.
	defaults write com.apple.dock minimize-to-application -bool true

	# Enable spring loading for all Dock items.
	defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

	# Show indicator lights for open applications in the Dock.
	defaults write com.apple.dock show-process-indicators -bool true

	# Don’t automatically rearrange Spaces based on most recent use.
	defaults write com.apple.dock mru-spaces -bool false

	# Remove the auto-hiding Dock delay.
	# defaults write com.apple.dock autohide-delay -float 0
	# Remove the animation when hiding/showing the Dock.
	# defaults write com.apple.dock autohide-time-modifier -float 0

	# Automatically hide and show the Dock.
	defaults write com.apple.dock autohide -bool true

	# Make Dock icons of hidden applications translucent.
	defaults write com.apple.dock showhidden -bool true

	# Scroll up on a Dock icon to show all Spaces opened windows for an
	# app, or open stack.
	defaults write com.apple.dock "scroll-to-open" -bool true

	# Restart Dock.
	killall Dock &> /dev/null
}
