#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# alias for working on dotfiles
# see https://wiki.archlinux.org/title/Dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
PS1='[\u@\h \W]\$ '

if uwsm check may-start && uwsm select; then
	exec uwsm start default
fi
