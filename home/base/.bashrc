PS1="\[\033]0;\u@\h:\w\007\]"
PS1="$PS1[\u@\h \W]\$ "

test -f ~/.bash_aliases && . ~/.bash_aliases
test -f ~/.bash_functions && . ~/.bash_functions
test -f ~/.bash_local && . ~/.bash_local

LS_COLORS_BASE='no=00:fi=00:di=1;1:ln=00:pi=00:so=00:do=00:bd=00:cd=00:or=00:mi=00:ex=00:su=00:sg=00:ca=00:tw=00:ow=00:st=00:';
export LS_COLORS="$LS_COLORS_BASE"
export EDITOR=vim
export GPG_TTY=$(tty)

PATH=$PATH:/home/guille/bin/
PATH=$PATH:/home/guille/.local/bin/
