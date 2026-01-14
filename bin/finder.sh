#!/usr/bin/env zsh


configure_finder() {
	# Set sidebar icon size to medium.
	defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

	# Expand save panel by default.
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

	# Expand print panel by default.
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

	# Save to disk (not to iCloud) by default.
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

	# Automatically quit printer app once the print jobs complete.
	defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

	# Disable the “Are you sure you want to open this application?” dialog.
	defaults write com.apple.LaunchServices LSQuarantine -bool false

	# Remove duplicates in the “Open With” menu (also see `lscleanup` alias).
	# "The -kill option has been removed because it was dangerous and no longer useful."
	# /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

	# Allow quitting via ⌘ + Q; doing so will also hide desktop icons.
	# defaults write com.apple.finder QuitMenuItem -bool true

	# Disable window and Get Info animations.
	defaults write com.apple.finder DisableAllAnimations -bool true

	# Show hidden files by default.
	# defaults write com.apple.finder AppleShowAllFiles -bool true

	# Show all filename extensions.
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

	# Disable the warning when changing a file extension.
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

	# Show status bar.
	defaults write com.apple.finder ShowStatusBar -bool true

	# Show path bar.
	defaults write com.apple.finder ShowPathbar -bool true

	# Display full POSIX path as Finder window title.
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

	# Keep folders on top when sorting by name.
	defaults write com.apple.finder _FXSortFoldersFirst -bool true

	# Enable spring loading for directories.
	defaults write NSGlobalDomain com.apple.springing.enabled -bool true

	# Remove the spring loading delay for directories.
	defaults write NSGlobalDomain com.apple.springing.delay -float 0

	# Avoid creating .DS_Store files on network or USB volumes.
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

	# Use column view in all Finder windows by default.
	# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `glyv`
	defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

	# Enable AirDrop over Ethernet and on unsupported Macs running Lion.
	defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

	# Show the ~/Library folder.
	chflags nohidden ~/Library

	# Show the /Volumes folder.
	sudo chflags nohidden /Volumes

	# Expand the following File Info panes:
	# “General”, “Open with”, and “Sharing & Permissions”
	defaults write com.apple.finder FXInfoPanesExpanded -dict \
	    General -bool true \
	    OpenWith -bool true \
	    Privileges -bool true


	## DESKTOP ###########################################################
	######################################################################

	# Keep folders on top.
	defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

	# Show icons for hard drives, servers, and removable media on the desktop.
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
	defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
	defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

	# Show item info near icons on the desktop and in other icon views.
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
	# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

	# Show item info to the right of the icons on the desktop.
	/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

	# Enable snap-to-grid for icons on the desktop and in other icon views.
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
	# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

	# Increase grid spacing for icons on the desktop and in other icon views.
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
	# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

	# Increase the size of icons on the desktop and in other icon views.
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
	# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist

	# Restart Finder.
	killall Finder &> /dev/null
}
