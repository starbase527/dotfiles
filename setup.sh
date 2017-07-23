#!/usr/bin/env zsh

BASEDIR="${0:A:h}";
cd $BASEDIR;
git submodule update --init --recursive "dotbot";

if [[ `uname` = 'Darwin' ]]; then
echo "Beginning macOS-specific configuration...";

source osx-setup.sh

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

if ! $(grep 'ZDOTDIR' $ZSHENVFILE &> /dev/null) ; then
	echo 'ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config/zsh}"' \
		| sudo tee -a $ZSHENVFILE >> /dev/null;
	echo "done.";
else
	echo "failed.";
	echo "You may need to update zsh to respect ~/.config/zsh manually";
fi;

