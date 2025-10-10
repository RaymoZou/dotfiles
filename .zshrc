# Created by newuser for 5.9

autoload -Uz compinit promptinit vcs_info
compinit
promptinit
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST

PROMPT='➜ %F{blue}%n%F{white}@%m %1~%F{green}(${vcs_info_msg_0_})%F{white}$ '

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
