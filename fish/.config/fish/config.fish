alias gs='git status'

# Vi mode
fish_vi_key_bindings
function fish_mode_prompt; end
set fish_cursor_default block blink
set fish_cursor_insert line blink

# Node
nvm use latest >/dev/null

# Haskell
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/aloussase/.ghcup/bin $PATH

# Deno
set DENO_INSTALL $HOME/.deno
set -gx PATH $DENO_INSTALL/bin:$PATH $PATH

# Ruby
rvm default
