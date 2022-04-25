# http://zsh.sourceforge.net/Guide/zshguide02.html#l24
typeset -U path
path=(~/.local/bin $path)
fpath=(~/.local/share/zsh/site-functions "${fpath[@]}")

SRC_GITHUB="$HOME/.local/src/github"
NGINX_DOCUMENT_ROOT="/var/www/localhost/htdocs"
#LESS+=" -c"
PROXYCHAINS_QUIET_MODE=1
CLICOLOR_FORCE=1
export GPG_TTY=$(tty)

PASSWORD_STORE_DIR="$HOME/.local/src/local/password-store"
