#!/bin/bash

# Close System Preferences to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null
osascript -e 'tell application "System Settings" to quit' 2>/dev/null

###############################################################################
# Global / NSGlobalDomain                                                     #
###############################################################################

# Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Scrollbar visibility
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Double-click titlebar does NOT minimize
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

# Disable press-and-hold for keys (enable key repeat)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable auto-correct and smart substitutions
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Use Fn key to change input source
defaults write com.apple.HIToolbox AppleFnUsageType -int 2

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Show control characters in text
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable animated focus ring
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Sidebar icon size: large
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 4

# Font smoothing
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Week starts on Monday
defaults write NSGlobalDomain AppleFirstWeekday -dict gregorian -int 2

# Date format: y.MM.dd
defaults write NSGlobalDomain AppleICUDateFormatStrings -dict 1 -string "y.MM.dd"

###############################################################################
# Dock                                                                        #
###############################################################################

# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true

# No delay for auto-hide
defaults write com.apple.dock autohide-delay -float 0

# No animation for auto-hide
defaults write com.apple.dock autohide-time-modifier -float 0

# Dock icon size
defaults write com.apple.dock tilesize -int 79

# Disable magnification
defaults write com.apple.dock magnification -bool false

# Minimize using scale effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Don't animate opening applications
defaults write com.apple.dock launchanim -bool false

# Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Don't show recent applications
defaults write com.apple.dock show-recents -bool false

# Show hidden app icons as translucent
defaults write com.apple.dock showhidden -bool true

# Don't group windows by app in Expose
defaults write com.apple.dock expose-group-by-app -bool false

# Speed up Expose animation
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don't rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Enable spring-loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Highlight hover effect for grid stacks
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Hot corners
# Bottom-left: Start Screen Saver (5)
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom-right: Quick Note (14)
defaults write com.apple.dock wvous-br-corner -int 14
# Top-left: Mission Control (2)
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top-right: Desktop (4)
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0

###############################################################################
# Finder                                                                      #
###############################################################################

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show POSIX path in title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Sort folders first
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# New Finder windows open to Desktop
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file:///Users/${USER}/Desktop/"

# Don't show icons on the desktop
defaults write com.apple.finder CreateDesktop -bool false

# Disable all Finder animations
defaults write com.apple.finder DisableAllAnimations -bool true

###############################################################################
# Desktop Services                                                            #
###############################################################################

# Don't write .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Don't write .DS_Store on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# Screenshots                                                                 #
###############################################################################

# Save screenshots to ~/Desktop/screenshots
defaults write com.apple.screencapture location -string "${HOME}/Desktop/screenshots"
defaults write com.apple.iphonesimulator "ScreenShotSaveLocation" -string "~/Desktop/screenshots/simulator"

# Save screenshots as PNG
defaults write com.apple.screencapture type -string "png"

# Default to selection mode
defaults write com.apple.screencapture style -string "selection"

###############################################################################
# Screen Saver / Lock Screen                                                  #
###############################################################################

# Require password immediately after sleep or screen saver
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 0

###############################################################################
# Trackpad                                                                    #
###############################################################################

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Enable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

###############################################################################
# Menu Bar Clock                                                              #
###############################################################################

# Digital clock, 24-hour, show date and day of week
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock Show24Hour -bool true
defaults write com.apple.menuextra.clock ShowAMPM -bool false
defaults write com.apple.menuextra.clock ShowDate -int 1
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true

###############################################################################
# Window Manager                                                              #
###############################################################################

# Disable Stage Manager
defaults write com.apple.WindowManager GloballyEnabled -bool false

# Disable click wallpaper to show desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Disable tiling margins and edge drag tiling
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false
defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool false
defaults write com.apple.WindowManager EnableTilingOptionAccelerator -bool false
defaults write com.apple.WindowManager EnableTopTilingByEdgeDrag -bool false

# Hide desktop items
defaults write com.apple.WindowManager HideDesktop -bool true

# Don't hide widgets
defaults write com.apple.WindowManager StageManagerHideWidgets -bool false
defaults write com.apple.WindowManager StandardHideWidgets -bool false

###############################################################################
# TextEdit                                                                    #
###############################################################################

# Use plain text mode by default
defaults write com.apple.TextEdit RichText -bool false

# Use UTF-8 encoding
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 100

# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Show CPU usage in Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

###############################################################################
# Gatekeeper                                                                  #
###############################################################################

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# quit when finished printing
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# time machine backup prompt
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool true

# apple intelligence dumbassery
defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool false

# spotify dumbassery
defaults write com.spotify.client.plist AutoStartSettingIsHidden -bool false

##
# energy saving
##
sudo pmset -a lidwake 1
sudo pmset -a autorestart 1
sudo systemsetup -setrestartfreeze on
sudo pmset -a displaysleep 15
sudo pmset -c sleep 0
sudo pmset -b sleep 5
sudo pmset -a standbydelay 86400
sudo systemsetup -setcomputersleep Off > /dev/null
sudo pmset -a hibernatemode 0

###
# reload
###
for app in "Activity Monitor" "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &>/dev/null
done

