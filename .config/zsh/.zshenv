# ---------------------------------------------------------------------------------------
# ---{ My ~/.zshenv } -------------------------------------------------------------------
# ---------------------------------------------------------------------------------------
#
#   Unlike the ~/.zprofile, this file is sourced often, and it's a good place to put
#   variables that are subject to change throughout the session such as the PATH
#
#   By setting it in that file, reopening a terminal emulator will start a new Zsh
#   instance with the PATH value updated.

function check_for_command(){ command -v $1 >/dev/null 2>&1 }

# ---{ XDG Compliance}-------------------------------------------------------------------

# Set XDG Base Directory
export XDG_LOCAL_HOME="$HOME/.local"
export XDG_DATA_HOME="$XDG_LOCAL_HOME/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Follow XDG Basedir Spec
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"
export LESSHISTFILE="$XDG_CONFIG_HOME/less/history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export ZPLUG_HOME="$XDG_DATA_HOME/zplug"
export ZPLUG_LOADFILE="$ZDOTDIR/packages.zsh"
export ZPLUG_CACHE_DIR="$XDG_DATA_HOME/zplug/.cache"
export ZPLUG_REPOS="$XDG_DATA_HOME/zplug/repos"
export _Z_DATA="$XDG_DATA_HOME/z"

# ---------------------------------------------------------------------------------------

if check_for_command ssh
then export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
fi

if check_for_command gpg
then export GPG_TTY=$(tty)
fi

if check_for_command nvim
then export EDITOR='nvim'
else export EDITOR='vi'
fi

function PATH_append(){
    if [[ -e $1 ]] && [[ ":$PATH:" != *":$1:"* ]]
    then PATH="$1:$PATH"
    fi
}

PATH_append "$XDG_CONFIG_HOME/scripts"
PATH_append "$XDG_DATA_HOME/bin"

export PATH