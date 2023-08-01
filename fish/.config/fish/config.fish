alias gs='git status'

rvm default

rvm use 3.1.0  >/dev/null
nvm use 16     >/dev/null

# Vi mode
fish_vi_key_bindings
function fish_mode_prompt; end
set fish_cursor_default block blink
set fish_cursor_insert line blink

# Some coursier thing
set -gx PATH "$PATH:/home/aloussase/.local/share/coursier/bin"
