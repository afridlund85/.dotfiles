
alias v='nvim' # default Neovim config
alias ll='ls -alh'

export PS1='\w$(__git_ps1 " (%s)")\$ '

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export EDITOR=nvim

NVIM_PATH="/opt/nvim-linux-x86_64/bin"
export GOPATH="$HOME/go"
NODE_PATH="$(which node)"
export NODE_PATH
export NVM_DIR="$HOME/.config/nvm"
export RUST_BIN="$HOME/.cargo/bin"

export PATH="$NVIM_PATH:$RUST_BIN:$NODE_PATH/bin:$GOPATH/bin:$HOME/.local/bin:$PATH"


[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
