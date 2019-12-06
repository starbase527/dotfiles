#!/usr/bin/env zsh

# Install Homebrew if not installed
echo -n "\tChecking Homebrew installation...";
if ! $(which brew > /dev/null); then
	echo;
	echo "\tInstalling homebrew"
	/usr/bin/ruby -e "$(curl -fsSL \
		https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi;
echo "done."

echo -n "\tInstalling from Brewfile...";
if ! $(brew bundle --file=~/.dotfiles/Brewfile &> ~/brew_bundle_log); then
	echo "failed (see ~/brew_bundle_log.)";
else
	echo "done.";
fi;

# Create shortcut directory
mkdir ~/sc

# Setup minimal Dock
echo -n "\tSetting up dock... ";

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock "show-process-indicators" -bool false

if $(which dockutil > /dev/null 2>> ~/setup_log); then
	dockutil --remove all --no-restart;

	dockutil --add /Applications/Safari.app   \
		--position beginning --no-restart;
	dockutil --add /Applications/MailMate.app \
		--after "Safari" --no-restart;

	dockutil --add ~/sc --no-restart \
		--view grid --display folder --sort kind --position beginning;
	dockutil --add "$HOME" --label "`whoami`" --no-restart \
		--view grid --display folder --sort kind --after "sc";
	dockutil --add "$HOME/Downloads" \
		--view grid --display folder --sort datemodified --after "`whoami`";
	echo "done.";
else
	echo "failed.";
fi;


# System defaults (most of this sourced from https://mths.be/macos)
echo -n "\tSetting System defaults... ";

{
set -o XTRACE # for log
# Some misc. system-wide stuff
defaults write -g NSPreferredWebServices -dict NSWebServicesProviderWebSearch '{NSDefaultDisplayName = DuckDuckGo; NSProviderIdentifier = "com.duckduckgo"; }'
defaults write -g AppleAccentColor -int 1
defaults write -g AppleHighlightColor "1.000000 0.874510 0.701961 Orange"

# Language/Text formats
defaults write NSGlobalDomain AppleLanguages -array "fr-FR" "en-GB" "ru" "en";
defaults write NSGlobalDomain AppleLocale -string "fr_FR@currency=AUD";
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters";
defaults write NSGlobalDomain AppleMetricUnits -bool true;
defaults write NSGLobalDomain AppleTemperatureUnit -string "Celsius";

# Finder defaults
defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -bool false;
defaults write com.apple.Finder ShowHardDrivesOnDesktop -bool false;
defaults write com.apple.Finder ShowMountedServersOnDesktop -bool false;
defaults write com.apple.Finder ShowRemovableMediaOnDesktop -bool false;

defaults write com.apple.Finder ShowPathbar -bool true;
defaults write com.apple.Finder _FXSortFoldersFirst -bool true;
defaults write com.apple.Finder FXPreferredViewStyle -string "icnv";

defaults write NSGlobalDomain AppleShowAllExtensions -bool true;

# Make all Finder views arrange by kind, icon size 64 and spacing 50
/usr/libexec/PlistBuddy -c \
		"Set :DesktopViewSettings:IconViewSettings:arrangeBy kind" \
		~/Library/Preferences/com.apple.finder.plist;
/usr/libexec/PlistBuddy -c \
		"Set :FK_StandardViewSettings:IconViewSettings:arrangeBy kind" \
		~/Library/Preferences/com.apple.finder.plist;
/usr/libexec/PlistBuddy -c \
		"Set :StandardViewSettings:IconViewSettings:arrangeBy kind" \
		~/Library/Preferences/com.apple.finder.plist;

/usr/libexec/PlistBuddy -c \
	"Set :DesktopViewSettings:IconViewSettings:gridSpacing 50" \
	~/Library/Preferences/com.apple.finder.plist;
/usr/libexec/PlistBuddy -c \
	"Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 50" \
	~/Library/Preferences/com.apple.finder.plist;
/usr/libexec/PlistBuddy -c \
	"Set :StandardViewSettings:IconViewSettings:gridSpacing 50" \
	~/Library/Preferences/com.apple.finder.plist;

/usr/libexec/PlistBuddy -c \
	"Set :DesktopViewSettings:IconViewSettings:iconSize 64" \
	~/Library/Preferences/com.apple.finder.plist;
/usr/libexec/PlistBuddy -c \
	"Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" \
	~/Library/Preferences/com.apple.finder.plist;
/usr/libexec/PlistBuddy -c \
	"Set :StandardViewSettings:IconViewSettings:iconSize 64" \
	~/Library/Preferences/com.apple.finder.plist;

# General other system stuff
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true;
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true;
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true;

# Safari & Webkit
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true;
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false;
defaults write com.apple.Safari "ShowFavouritesBar-v2" -bool true;
defaults write com.apple.Safari ShowOverlayStatusBar -bool true;
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true;
defaults write com.apple.Safari InstallExtensionUpdatesAutomaically -bool true;

defaults write com.apple.Safari AutoFillFromAddressBook -bool true;
defaults write com.apple.Safari AutoFillPasswords -bool false;
defaults write com.apple.Safari AutoFillCreditCardData -bool false;
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false;

defaults write com.apple.Safari IncludeDevelopMenu -bool true;
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true;
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WekKit2DeveloperExtrasEnabled -bool true;
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true;

# TODO: Terminal
open -ag Terminal "terminal-solarized/Solarized Dark.terminal"
open -ag Terminal "terminal-solarized/Solarized Light.terminal"

defaults write com.apple.Terminal "Default Window Settings" "Solarized Dark"
defaults write com.apple.Terminal "Startup Window Settings" "Solarized Dark"

# TODO: Mac App Store

set +o XTRACE
} &>> ~/setup_log

# Set computer name
echo "Setting hostname, computer name..." | tee -a ~/setup_log
sudo scutil --set HostName
sudo scutil --set LocalHostName
sudo scutil --set ComputerName
echo "done." | tee -a ~/setup_log

echo "done (check ~/setup_log for errors).";

