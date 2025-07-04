# Created by newuser for 5.9

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt fade red

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
