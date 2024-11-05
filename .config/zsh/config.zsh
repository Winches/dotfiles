## OPTION
ZSH_CACHE="${XDG_CACHE_HOME}/zsh"
HISTFILE="${ZSH_CACHE}/.zsh_history"                   # history file path
HISTSIZE=8000                                          # maximum events for internal history
SAVEHIST=8000                                          # maximum events in history file
DIRSTACKSIZE=5                                         # size of directory stack
ZSH_COMPDUMP="${ZSH_CACHE}/.zcompdump-${ZSH_VERSION}"  # zcompdump file path

# common
setopt nobeep                # no beep
setopt correct               # correct mistakes
setopt extended_glob         # extended globbing syntax

# navigation
setopt autocd                # change directory without 'cd'
setopt auto_pushd            # push the current directory visited on the stack
setopt pushd_ignore_dups     # do not store duplicates in the stack
setopt pushd_silent          # do not print the directory stack after pushd or popd

# history
setopt hist_ignore_all_dups  # ignore duplicate command
setopt hist_ignore_space     # ingore event starting with a space
setopt inc_append_history    # insert history immediately
setopt share_history         # share history between sessions

# completion
zstyle ':completion:*' menu select                                                 # highlight menu selection(limit to 3 lines)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"                            # completion color (dirs/files/etc)
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'  # case insensitive tab completion
zstyle ':completion:*' use-cache on                                                # completion cache
zstyle ':completion:*' cache-path $ZSH_CACHE                                       # completion cache path

# autoload -Uz compinit
# compinit -d $ZSH_COMPDUMP

post_configure () {
    # completion
    setopt menu_complete         # hit tab once
}


## PLUGIN
# oh-my-zsh
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder                     # update mode
zstyle ':omz:update' frequency 30                      # update frequency(days)
# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244,bold"          # style of auto suggestions
# zsh-z
ZSHZ_DATA="${ZSH_CACHE}/.z"                            # database file
# alias finder
zstyle ':omz:plugins:alias-finder' autoload yes        # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes          # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes           # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes         # disabled by default


## KEYBINDING
bindkey "^K" kill-line
# beginning-of-line
bindkey "^A"          beginning-of-line
bindkey '^[[7~'       beginning-of-line
bindkey '^[[H'        beginning-of-line
if [[ "${terminfo[khome]}" != "" ]]; then
    bindkey "${terminfo[khome]}" beginning-of-line
fi
# end-of-line
bindkey "^E"          end-of-line
bindkey '^[[8~'       end-of-line
bindkey '^[[F'        end-of-line
if [[ "${terminfo[kend]}" != "" ]]; then
    bindkey "${terminfo[kend]}" end-of-line
fi
