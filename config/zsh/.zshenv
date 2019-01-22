
if [[ $(uname) == "Darwin" ]]; then
	PACKAGE_PREFIX=/usr/local
else
	PACKAGE_PREFIX=/usr
fi;
export PACKAGE_PREFIX

if [ -n "$BASH_VERSION" ]; then
	export CDPATH="~/sc";
elif [ -n "$ZSH_VERSION" ]; then
	export cdpath=(. ~/sc)
	export HISTFILE="${ZDOTDIR}/histfile"
fi;

export LANG="fr_FR.UTF-8"

# Don't clutter home directory:
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export LESSHISTFILE="-";

# Make GNU readline respect XDG
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

export PLATFORMIO_HOME_DIR="$XDG_DATA_HOME/platformio"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

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


