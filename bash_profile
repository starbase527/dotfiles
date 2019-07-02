
export LANG="fr_FR.UTF-8"

set -o vi

echo "WARNING: You are using bash"

if [ -f $HOME/.config/zsh/.zshenv ]; then
	source $HOME/.config/zsh/.zshenv;
fi;

if [ -d $HOME/.config/zsh/zshrc.d ]; then
	for file in $HOME/.config/zsh/zshrc.d/*; do
		source $file;
	done;
fi;

if command -v brew > /dev/null; then
	BREW_COMPLETION="$(brew --prefix)/etc/bash_completion.d/brew"
	if [ -f "$BREW_COMPLETION" ]; then
		source "$BREW_COMPLETION"
	fi;
fi;

