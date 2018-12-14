
export PATH=$HOME/.local/bin:$PATH:$HOME/opt/GNAT/2018/bin

if [ -n "$BASH_VERSION" ]; then
	export CDPATH="~/sc";
elif [ -n "$ZSH_VERSION" ]; then
	export cdpath=(. ~/sc)
	export HISTFILE="${ZDOTDIR}/.history"
fi;

export LANG="fr_FR.UTF-8"

# Don't clutter home directory:
export XDG_CONFIG_HOME="${HOME}/.config"

export LESSHISTFILE="-";

# Make GNU readline respect XDG
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

export EDITOR="nvim";
export VISUAL="nvim";

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

# Colorised man pages
# Source: https://unix.stackexchange.com/questions/119/colors-in-man-pages
export LESS_TERMCAP_mb=$(printf "\e[1;31m")
export LESS_TERMCAP_md=$(printf "\e[1;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[0;37;102m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[4;32m")


