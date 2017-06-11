# Lines configured by zsh-newuser-install
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


# Run each separate files (env, path, etc)
if [ -d $ZDOTDIR/zshrc.d ]; then
	for file in $ZDOTDIR/zshrc.d/*; do
		source $file
	done
fi

# If running in tmux on OS X, then connect vim to clipboard
if uname | grep -q "Darwin"; then
	if [[ -n "$TMUX" ]]; then
		alias nvim='reattach-to-user-namespace nvim'
		alias vim='reattach-to-user-namespace nvim'
	else
		alias vim='nvim'
	fi
fi

# Activate more completions (from Homebrew)
fpath=(/usr/local/share/zsh-completions $fpath)

# Activate zsh syntax highlighting (from Homebrew)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

