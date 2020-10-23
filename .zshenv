# http://zsh.sourceforge.net/Guide/zshguide02.html#l24
typeset -U path
path=(~/.local/bin $path)

SRC_GITHUB="$HOME/.local/src/github"
PROXYCHAINS_QUIET_MODE=1
CLICOLOR_FORCE=1
export GPG_TTY=$(tty)
