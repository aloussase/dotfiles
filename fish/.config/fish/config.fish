alias gs='git status'

rvm default

rvm use 3.1.0  >/dev/null
nvm use 16     >/dev/null

export FLYCTL_INSTALL="/home/aloussase/.fly"

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/aloussase/.local/share/coursier/bin"
# <<< coursier install directory <<<
