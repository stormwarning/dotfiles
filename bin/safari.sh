#!/usr/bin/env zsh


configure_safari() {
	# Show the full URL in the address bar.
	defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

	# Set Safari’s home page to `about:blank` for faster loading.
	# defaults write com.apple.Safari HomePage -string "about:blank"

	# Prevent Safari from opening ‘safe’ files automatically after downloading.
	defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

	# Disable Safari’s thumbnail cache for History and Top Sites
	defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

	# Enable Safari’s debug menu.
	defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

	# Make Safari’s search banners default to Contains instead of Starts With.
	defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

	# Remove useless icons from Safari’s bookmarks bar.
	defaults write com.apple.Safari ProxiesInBookmarksBar "()"

	# Enable the Develop menu and the Web Inspector in Safari.
	defaults write com.apple.Safari IncludeDevelopMenu -bool true
	defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

	# Add a context menu item for showing the Web Inspector in web views.
	defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

	# Enable continuous spellchecking.
	defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

	# Disable auto-correct.
	defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

	# Disable AutoFill.
	# defaults write com.apple.Safari AutoFillFromAddressBook -bool false
	# defaults write com.apple.Safari AutoFillPasswords -bool false
	defaults write com.apple.Safari AutoFillCreditCardData -bool false
	defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

	# Warn about fraudulent websites.
	defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

	# Disable plug-ins.
	defaults write com.apple.Safari WebKitPluginsEnabled -bool false
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

	# Disable Java.
	defaults write com.apple.Safari WebKitJavaEnabled -bool false
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false

	# Block pop-up windows.
	defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

	# Disable auto-playing video.
	# defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
	# defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
	# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
	# defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

	# Enable “Do Not Track”.
	defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

	# Update extensions automatically.
	defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

	# Restart Safari.
	killall Safari &> /dev/null
}
