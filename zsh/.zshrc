if command -v oh-my-posh >/dev/null; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/material.omp.json)"
fi

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias ls='ls --color=auto'
alias gs='git status'


PATH="$PATH:$HOME/go/bin"
export PATH

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" 
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
