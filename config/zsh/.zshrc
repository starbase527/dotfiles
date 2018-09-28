# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=4
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ZSH Line editing: enter normal mode and press 'v' to open line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Run each separate files (env, path, etc)
if [ -d $ZDOTDIR/zshrc.d ]; then
	for file in $ZDOTDIR/zshrc.d/*; do
		source $file
	done
fi

# Activate more completions (from Homebrew)
fpath=(/usr/local/share/zsh-completions $fpath)

# Activate zsh syntax highlighting (from Homebrew)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

