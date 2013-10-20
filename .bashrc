_OS_=${OSTYPE//[0-9.]/}

PS1='\u\[\033[00;32m\]@\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[00;35m\]\$\[\033[00m\] '

function orly {
    CMD=`history 2 | head -n 1 | sed 's/^[ ]*[0-9]*//'`
    sudo $CMD
}

export PAGER="less"
export EDITOR="vim"

export PYTHONPATH=$HOME/python_modules

export NODE_PATH=$HOME/node_modules:/opt/node/bin:/opt/node/lib/node_modules
export GOROOT=/opt/go
export GOPATH=$HOME/golang

PATH=$PATH:/opt/clang/bin
PATH=/opt/node/bin:$PATH
PATH=$GOROOT/bin:$PATH
PATH=$PATH:/opt/scala/bin:$PATH
PATH=$HOME/bin:$PATH

if [[ -x /usr/bin/dircolors ]]; then
    [[ -f $HOME/.dircolors ]] && eval `dircolors $HOME/.dircolors`
fi



function linux_alias {
    alias ls="ls -F --color"
    alias grep="grep --color"
}

function openbsd_alias {
    alias ls="colorls -FG"
    alias tar="gtar"
    alias omake="/usr/bin/make"
    alias make="gmake"
}

case `uname` in
Linux) linux_alias
           ;;
OpenBSD)   openbsd_alias
           ;;
esac

alias ll="ls -l"

alias vi="vim"
alias psaxuw="ps axuw"

alias zp="curl 'http://0paste.com/pastes.txt' -F 'paste[paste]=<-'"

alias an="locate -e -i -d $HOME/ani.db:$HOME/ani_local.db"
alias andb="updatedb -l 0 -o $HOME/ani.db -U /media/HD-PCU2/animu"
alias anldb="updatedb -l 0 -o $HOME/ani_local.db -U /media/data/Anime"

alias hglog="hg log | less"
alias gi="git"
alias gt="git"
alias curl="curl -k"
alias sudo="sudo "

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
