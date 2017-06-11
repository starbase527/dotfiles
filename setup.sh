#!/usr/bin/env zsh

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

