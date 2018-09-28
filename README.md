
# macOS-centric dotfiles

Use at your own risk etc.

    git clone https://github.com/starbase527/dotfiles.git ~/.dotfiles
    .dotfiles/setup.sh

# Controversial things

- In my eagerness to keep my home directory tidy I've moved the ZSH config files to .config/zsh by setting $ZDOTDIR in /etc/zshenv:

      export ZDOTDIR="$HOME/.config/zsh"
