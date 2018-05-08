PS1="\[\033]0;\u@\h:\w\007\]"
PS1="$PS1\w\$ "
PS1="\[\033[35;2m\]$PS1\[\033[0m\]"

test -f ~/.bash_aliases && . ~/.bash_aliases
test -f ~/.bash_functions && . ~/.bash_functions
test -f ~/.bash_local && . ~/.bash_local

LS_COLORS_BASE='no=00:fi=00:di=1;1:ln=00:pi=00:so=00:do=00:bd=00:cd=00:or=00:mi=00:ex=00:su=00:sg=00:ca=00:tw=00:ow=00:st=00:';
export LS_COLORS="$LS_COLORS_BASE"
export EDITOR=vim
export GPG_TTY=$(tty)
export DESKTOP_SESSION=kde
export OOO_FORCE_DESKTOP=kde4
export PYTHONSTARTUP="$HOME/.pythonrc.py"


TERM="xterm-256color"

if [ -d "/usr/local/heroku/bin" ] ; then
	PATH="$PATH:/usr/local/heroku/bin"
fi

if [ -e "$HOME/.fehbg" ]; then
	. $HOME/.fehbg
fi

if which ruby >/dev/null && which gem >/dev/null; then
	PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

PATH="$PATH:$HOME/.local/bin/"
PATH="$PATH:$HOME/code/go/bin/"
GOPATH="$HOME/code/go/"

export PATH
export GOPATH
