
if [[ $(uname) == "Darwin" ]]; then
	PACKAGE_PREFIX=/usr/local
else
	PACKAGE_PREFIX=/usr
fi;
export PACKAGE_PREFIX

# XDG Variables!!!
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

if [ -n "$BASH_VERSION" ]; then
	export CDPATH="~/sc";
elif [ -n "$ZSH_VERSION" ]; then
	[[ -d ~/sc ]] && export cdpath=(. ~/sc)
fi;

export LANG="fr_FR.UTF-8"

export C_INCLUDE_PATH="$HOME/.local/include:$C_INCLUDE_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

# Don't clutter home directory:
export LESSHISTFILE="-";

export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
export STACK_ROOT="$XDG_DATA_HOME/stack"

export PERL_CPANM_HOME="$XDG_CACHE_HOME/cpanm"
export TLDR_CACHE_DIR="$XDG_CACHE_HOME/tldr"

# Make GNU readline respect XDG
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export RLWRAP_HOME="$XDG_CACHE_HOME/rlwrap"

# Python init file (sets python_history to be stored in $XDG_DATA_HOME)
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python3/startup.py"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PLATFORMIO_HOME_DIR="$XDG_DATA_HOME/platformio"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
export GPS_HOME="$XDG_DATA_HOME/gps"

export EDITOR="nvim";
export VISUAL="nvim";
export BAT_PAGER='less -RF'; # -F may cause problems for small files if not
                             # running more recent less than system's

# Ports to use for AnyBar instances
export AB_GFX=1738;
export AB_ANUVPN=1739;

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

# IDL
export IDL_STARTUP=${HOME}/IDL/idlstartup

# Colorised man pages
# Source: https://unix.stackexchange.com/questions/119/colors-in-man-pages
export LESS_TERMCAP_mb=$(printf "\e[1;31m")
export LESS_TERMCAP_md=$(printf "\e[1;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[0;37;102m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[4;32m")


