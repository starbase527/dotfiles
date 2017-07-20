#!/usr/bin/env zsh

BASEDIR="${0:A:h}";
cd $BASEDIR;
git submodule update --init --recursive "dotbot";

if [[ `uname` = 'Darwin' ]]; then
echo "Beginning macOS-specific configuration...";

# Setup minimal Dock
if $(which dockutil > /dev/null); then
	echo -n "\tSetting up dock... ";
	local uni_folder="$HOME/Documents/University/";
	uni_folder=$uni_folder/`ls $uni_folder | tail -n 1`;

	dockutil --remove all --no-restart;

	dockutil --add /Applications/Safari.app   \
		--position beginning --no-restart;
	dockutil --add /Applications/MailMate.app \
		--after "Safari" --no-restart;

	dockutil --add $uni_folder --no-restart \
		--view grid --display folder --sort kind --position beginning;
	dockutil --add "$HOME" --label "`whoami`" --no-restart \
		--view grid --display folder --sort kind --after "$uni_folder";
	dockutil --add "$HOME/Downloads" \
		--view grid --display folder --sort datemodified --after "`whoami`";
	echo "done.";
fi;

echo "done macOS-specific configuration.";
fi;

# Make zsh put its configuration files in ~/.config
# This part will need root permissions
echo -n "Updating zsh to use ~/.config... "
local ZSHENVFILE;
if [ -d /etc/zsh ]; then
	ZSHENVFILE=/etc/zsh/zshenv;
else
	ZSHENVFILE=/etc/zshenv;
fi;

if [[ ! $(grep 'ZDOTDIR' $ZSHENVFILE &> /dev/null) ]]; then
	echo 'ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config/zsh}"' \
		| sudo tee -a $ZSHENVFILE >> /dev/null;
	echo "done.";
else
	echo;
	echo "You may need to update zsh to respect ~/.config/zsh manually";
fi;

