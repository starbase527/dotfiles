#!/usr/bin/env zsh

./install

if [[ `uname` = 'Darwin' ]]; then
echo "Beginning macOS-specific configuration...";

source osx-setup.sh

echo "done macOS-specific configuration.";
fi;

# Switch login shell to zsh
if [ -x /usr/local/bin/zsh ]; then
	login_shell=/usr/local/bin/zsh
else
	login_shell="$(which zsh)"
fi;
echo -n "Switching login shell to zsh... "
if ! grep -q "$login_shell" /etc/shells; then
	echo "$login_shell" | sudo tee -a /etc/shells > /dev/null
fi;
sudo chsh -s "$login_shell" "$USER"
echo "done."

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
	echo 'ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"' \
		| sudo tee -a $ZSHENVFILE >> /dev/null;
	echo "done.";
else
	echo "failed.";
	echo "You may need to update zsh to respect ~/.config/zsh manually";
fi;

# Setup git with github id
echo "Setting up git... "

local git_config=~/.config/git/config.local;
mkdir -p $(dirname "$git_config")
echo -n "\n[user]\n\tname\t= \"" > $git_config;
echo -n "\tEnter github name: ";
read githubName;
echo -n "$githubName\"\n\temail\t= \"" >> $git_config;
echo -n "\tEnter github email (username if you wish to use noreply): ";
read githubEmail;
if ! $(echo $githubEmail | grep '@' > /dev/null); then
	githubEmail=$githubEmail"@users.noreply.github.com";
fi;
echo "$githubEmail\"\n" >> $git_config;
echo >> $git_config;
echo -n "\n[credential]\n\thelper\t= osxkeychain" >> $git_config;

echo "done."

