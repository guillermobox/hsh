if [ -x /usr/bin/dircolors ]; then
    alias ls='\ls --color=auto'
    alias grep='\grep --color=auto'
    alias fgrep='\fgrep --color=auto'
    alias egrep='\egrep --color=auto'
fi

# some more ls aliases
alias ack='ack-grep'
alias nautilus="nautilus --no-desktop&"
alias ls="ls --color --group-directories-first"
alias ll="ls -lcrt"
alias hoy="date -I"
alias tree="tree -C -I .git"
alias vi="vim"
