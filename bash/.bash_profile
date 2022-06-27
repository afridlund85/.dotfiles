. ~/.bashrc
. ~/.git-completion.bash
. ~/.git-prompt.sh

alias ls='ls -alh'

export PS1='\w$(__git_ps1 " (%s)")\$ '

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

NVIM_PATH="/usr/local/nvim/bin"
export DENO_INSTALL="$HOME/.deno"
export GOPATH="$HOME/go"
GO_BIN_PATH="/usr/local/go/bin/"
NODE_PATH="$(which node)"
export NODE_PATH
export NVM_DIR="$HOME/.config/nvm"
LUA_LSP_PATH="/usr/local/lua-language-server/bin"
export RUST_PATH="$HOME/.cargo/bin"

export PATH="$NVIM_PATH:$RUST_PATH:$LUA_LSP_PATH:$DENO_INSTALL/bin:$NODE_PATH/bin:$GO_BIN_PATH:$GOPATH/bin:$HOME/.local/bin:$PATH"

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && . ~/.fzf.bash

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
