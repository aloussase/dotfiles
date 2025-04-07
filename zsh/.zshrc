if command -v oh-my-posh >/dev/null; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/material.omp.json)"
fi

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias ls='ls --color=auto'
alias gs='git status'


PATH="$PATH:$HOME/go/bin"
PATH="$PATH:$HOME/.cabal/bin"
PATH="$PATH:$HOME/Library/Python/3.9/bin"
PATH="$PATH:$HOME/.cache/rebar3/bin"
export PATH

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" 
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME="$HOME"/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
