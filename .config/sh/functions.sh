#!/usr/bin/sh

# Ask cheat.sh website for details about a Linux command.
cheat() {
    curl -m 10 "https://cheat.sh/${1}" 2>/dev/null || printf '%s\n' "[ERROR] Something broke"
}

# Create a new directory and enter it
mkd() {
	mkdir -p "$@" && cd "$_";
}

# Get zsh option
getopt() {
    echo $options[$1]
}

# Find zstyle
fzstyle() {
    zstyle -L | grep $1
}

# Check current directory path
## such as in_path '/mnt'
in_directory() {
    target_path="$1"

    if [ -z "$target_path" ]; then
        echo "Path is not provided"
        return 1
    fi

    if [[ "$PWD" == "$target_path"* ]]; then
        return 0
    else
        return 1
    fi
}

# Check is wsl or not
is_wsl(){
    [ -n "$WSL_DISTRO_NAME" ]
}

# WSL
if is_wsl ; then

    # Wrap the git command to either run windows git or linux
    git() {
        if in_directory /mnt; then
            git.exe "$@"
        else
            /usr/bin/git "$@"
        fi
    }

    # Get host ip of windows
    winip() {
        ip route | grep default | awk '{print $3}'
    }

fi

# Add opt to path
add_opt_path(){
    for dir in /opt/*; do
        export PATH="$PATH:$dir"
        test -d $dir/bin && export PATH="$PATH:$dir/bin"
    done
}
