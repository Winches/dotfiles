#!/usr/bin/sh

## COMMON
alias e="$EDITOR"
alias v="$VISUAL"
alias cls="clear"                            # clear screen
alias ls="ls --color=auto"                   # ls with colors
alias ll="ls -lA"                            # ls -al with colors
alias dir="dir --color=auto"                 # dir with colors
alias grep="grep --color=auto"               # grep with colors
alias ip="ip --color=auto"                   # ip with color
alias path='echo $PATH | tr -s ":" "\n"'     # pretty print path
alias fpath='echo $FPATH | tr -s ":" "\n"'   # pretty print fpath
alias df="df -h"                             # human-readable sizes

## NAVIGATION
# .., ..., ...., .....and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

## PROMPT AND VERBOSITY
alias cp="mv -iv"                            # confirm before move files
alias cp="cp -iv"                            # confirm before overwriting files
alias rm="rm -Iv"                            # confirm before remove files(more than three or recursively)
alias mkdir="mkdir -pv"                      # mkdir with verbose

## PROGRAMS
# kitty
alias kitty="kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty"
alias kssh="kitty +kitten ssh"               # ssh with kitty
# tmux
alias tmuxn="tmux new -s"
alias tmuxa="tmux attach -t"
alias tmuxk="tmux kill-session -t"
alias tmuxl="tmux list-sessions"
alias tmuxrl="tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf \; display 'tmux.conf reloaded'"