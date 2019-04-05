
export LANG="fr_FR.UTF-8"

set -o vi

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

