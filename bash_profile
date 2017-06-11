
if [ -d $HOME/.config/zsh/zshrc.d ]; then
	for file in $HOME/.config/zsh/zshrc.d/*; do
		source $file;
	done;
fi;

source $(brew --prefix)/etc/bash_completion.d/brew

