#!/usr/bin/sh

## XDG
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

## EDITOR
export EDITOR=nano
export VISUAL=$EDITOR

## PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

## SHELL
export SH_HOME="$XDG_CONFIG_HOME/sh"
export ZSH_HOME="$XDG_CONFIG_HOME/zsh"

## COLORS
test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"

## RUST
test -r ~/.cargo/env && . ~/.cargo/env
if ! [[ "$PATH" =~ "/opt/yazi-linux64:" ]]; then
    export PATH="/opt/yazi-linux64:$PATH"
fi

# fnm
FNM_PATH="$XDG_DATA_HOME/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$XDG_DATA_HOME/fnm:$PATH"
  eval "`fnm env --use-on-cd --version-file-strategy=recursive`"
fi
