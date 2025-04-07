#!/usr/bin/env bash


configure_macos() {
	# Set computer name (as done via System Preferences → Sharing)
	# Prompt for computer name.
	# echo "Enter computer name: \c"
	# read COMPUTER_NAME
	# COMPUTER_NAME_NS="${COMPUTER_NAME// /-}"

	# # Spaces are okay.
	# sudo scutil --set ComputerName $COMPUTER_NAME
	# sudo scutil --set HostName $COMPUTER_NAME

	# # No spaces for these.
	# sudo scutil --set LocalHostName $COMPUTER_NAME_NS
	# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME_NS

	# Reveal IP address, hostname, OS version, etc. when clicking the
	# clock in the login window.
	sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

	# Restart automatically if the computer freezes.
	# Error -99
	# sudo systemsetup -setrestartfreeze on

	# Set language and text formats.
	defaults write NSGlobalDomain AppleLanguages -array "en"
	defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=CAD"
	defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
	defaults write NSGlobalDomain AppleMetricUnits -bool true

	# Set the timezone; see `sudo systemsetup -listtimezones` for other values
	# Error -99
	# sudo systemsetup -settimezone "America/Edmonton" > /dev/null

	# Remove Spotlight from menubar.
	defaults write com.apple.Spotlight "NSStatusItem Visible Item-0" -int 0

	# Turn off Spotlight keyboard shortcut.
	defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "
		<dict>
			<key>enabled</key><false/>
			<key>value</key><dict>
				<key>type</key><string>standard</string>
				<key>parameters</key>
				<array>
					<integer>32</integer>
					<integer>49</integer>
					<integer>1048576</integer>
				</array>
			</dict>
		</dict>
	"
	# Ensure shortcut changes take effect immediately.
	/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u



	## MAC APP STORE #####################################################
	######################################################################

	# Enable the WebKit Developer Tools in the Mac App Store.
	defaults write com.apple.appstore WebKitDeveloperExtras -bool true
	# Enable Debug Menu in the Mac App Store.
	defaults write com.apple.appstore ShowDebugMenu -bool true
	# Enable the automatic update check.
	defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
	# Check for software updates daily, not just once per week.
	defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
	# Download newly available updates in background.
	defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1


	## PHOTOS ############################################################
	######################################################################

	# Prevent Photos from opening automatically when devices are
	# plugged in.
	defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


	## KILL AFFECTED APPLICATIONS ########################################
	######################################################################

	for app in "Photos" \
		"SystemUIServer"; do
		killall "${app}" &> /dev/null
	done
}
