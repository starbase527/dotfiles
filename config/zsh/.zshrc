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

# ZSH Line editing: enter normal mode and press 'v' to open line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Better history navigation
bindkey '^r' history-incremental-search-backward
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M viins '^[[A' up-line-or-beginning-search # ↑ in insert mode
bindkey -M vicmd 'j' down-line-or-beginning-search
bindkey -M viins '^[[B' down-line-or-beginning-search # ↓ in insert mode
# but note that arrows will do single forwards/back in normal mode

# Run each separate files (env, path, etc)
if [ -d $ZDOTDIR/zshrc.d ]; then
	for file in $ZDOTDIR/zshrc.d/*; do
		source $file
	done
fi

# Activate more completions (from Homebrew)
if [ -d $PACKAGE_PREFIX/share/zsh-completions ]; then
	fpath=($PACKAGE_PREFIX/share/zsh-completions $fpath)
elif [ -d $PACKAGE_PREFIX/share/zsh/plugins/zsh-completions ]; then
	fpath=($PACKAGE_PREFIX/share/zsh/plugins/zsh-completions $fpath)
fi;

# Activate zsh syntax highlighting (from Homebrew)
if [ -d $PACKAGE_PREFIX/share/zsh-syntax-highlighting ]; then
	source $PACKAGE_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -d $PACKAGE_PREFIX/share/zsh/plugins/zsh-syntax-highlighting ]; then
	source $PACKAGE_PREFIX/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi;

