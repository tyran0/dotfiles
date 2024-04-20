export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="$XDG_DATA_HOME/less/history"

# Node.js
NODE_VERSION=20.11.0
NODE_INSTALL="/usr/local/lib/node-v$NODE_VERSION-linux-x64"
PATH="$PATH:$NODE_INSTALL/bin"

# Global PNPM Modules
export PNPM_HOME="/home/tyran0/.local/share/pnpm"
PATH="$PATH:$PNPM_HOME"

# Cargo (Rust)
CARGO_INSTALL="$HOME/.cargo"
PATH="$PATH:$CARGO_INSTALL/bin"

export PATH
