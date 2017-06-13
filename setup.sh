#!/usr/bin/env zsh

BASEDIR="${0:A:h}";
cd $BASEDIR;
git submodule update --init --recursive "dotbot";

if [[ `uname` = 'Darwin' ]]; then

# Setup minimal Dock
if $(which dockutil > /dev/null); then
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
fi;

fi;

# This part will need root permissions
local ZSHENVFILE;
if [ -d /etc/zsh/zshenv ]; then
	ZSHENVFILE=/etc/zsh/zshenv;
else
	ZSHENVFILE=/etc/zshenv;
fi;

if [[ ! $(grep 'ZDOTDIR' $ZSHENVFILE) ]]; then
	sudo echo '$ZDOTDIR=$HOME/.config/zsh' >> $ZSHENVFILE;
else
	echo "You need to update zsh to respect ~/.config/zsh manually"
fi;

