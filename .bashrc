_OS_=${OSTYPE//[0-9.]/}

PS1='\u\[\033[00;32m\]@\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[00;35m\]\$\[\033[00m\] '

function oii {
    CMD=`history 2 | head -n 1 | sed 's/^[ ]*[0-9]*//'`
    sudo $CMD
}

PATH=$HOME/apps/node/bin:$PATH
PATH=$HOME/apps/rust/bin:$PATH
PATH=$HOME/bin:$PATH

export NODE_PATH=$HOME/apps/node/lib/node_modules
export GOPATH=$HOME/go
export WORKON_HOME=~/Envs

export PAGER="less"
export EDITOR="vim"

if [[ -x /usr/bin/dircolors ]]; then
    [[ -f $HOME/.dircolors ]] && eval `dircolors $HOME/.dircolors`
fi

function linux_alias {
    alias ls="ls -F --color"
    alias grep="grep --color"
}

function openbsd_alias {
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

source /usr/bin/virtualenvwrapper.sh

PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
