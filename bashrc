
PS1='\u\[\033[00;32m\]@\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[00;35m\]\$\[\033[00m\] '

oii() {
    CMD=`history 2 | head -n 1 | sed 's/^[ ]*[0-9]*//'`
    sudo $CMD
}

if [[ -x /usr/bin/dircolors ]]; then
    [[ -f $HOME/.dircolors ]] && eval `dircolors $HOME/.dircolors`
fi

linux_alias() {
    alias ls="ls -F --color"
    alias grep="grep --color"
}

openbsd_alias() {
    alias ls="colorls -FG"
}

case `uname` in
Linux)     linux_alias
           ;;
OpenBSD)   openbsd_alias
           ;;
esac

alias ll="ls -l"
alias vi="vim"
alias psaxuw="ps axuw"
alias zp="curl 'http://0paste.com/pastes.txt' -F 'paste[paste]=<-'"
alias hglog="hg log | less"
alias gi="git"
alias gt="git"
alias curl="curl -k"
alias sudo="sudo "
alias less="less -FSRX"

export GOPATH=$HOME/go
export WORKON_HOME=~/Envs
export PAGER="less"
export EDITOR="vim"


[[ -d /opt/git/bin ]] && PATH=/opt/git/bin:$PATH

[[ -d $HOME/apps/node ]] && PATH=$HOME/apps/node/bin:$PATH
[[ -d $HOME/apps/rust ]] && PATH=$HOME/apps/rust/bin:$PATH
[[ -d $HOME/apps/python ]] && PATH=$HOME/apps/python/bin:$PATH

[[ -d $HOME/apps/go ]] && {
    PATH=$HOME/apps/go/bin:$PATH
    export GOROOT=$HOME/apps/go
}

if [[ -f /usr/bin/virtualenvwrapper.sh ]];
then
    source /usr/bin/virtualenvwrapper.sh
else
    [[ -f $HOME/apps/python/bin/virtualenvwrapper.sh ]] && \
        source $HOME/apps/python/bin/virtualenvwrapper.sh
fi

[[ -d $HOME/.rvm/bin ]] && PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
