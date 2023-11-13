export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_STATE_HOME="$HOME/.local/state"

export VIMINIT="source $XDG_CONFIG_HOME/vimrc"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

USER_LIB=/usr/local/lib
USER_BIN=/usr/local/bin

NODE_VERSION=v20.9.0
NODE_INSTALL="$USER_LIB/node-$NODE_VERSION-linux-x64/bin"
PATH=$PATH:$NODE_INSTALL

export PATH
