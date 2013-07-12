_OS_=${OSTYPE//[0-9.]/}

PS1="\u\[\033[00;32m\]@\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[00;35m\]\$\[\033[00m\] "

export PAGER="less"
export EDITOR="vim"

export PYTHONPATH=$HOME/python_modules

export NODE_PATH=$HOME/node_modules:/opt/node/bin:/opt/node/lib/node_modules
export GOROOT=$HOME/linux-stub/go
export GOPATH=$HOME/golang:$GOROOT

PATH=$PATH:/opt/clang/bin
PATH=/opt/node/bin:$PATH
PATH=/opt/qemu/bin:$PATH
PATH=/opt/deadbeef/bin:$PATH
PATH=$PATH:$GOROOT/bin
PATH=$HOME/android-sdk-linux_x86/platform-tools:$PATH

if [[ -x /usr/bin/dircolors ]]; then
    [[ -f $HOME/.dircolors ]] && eval `dircolors $HOME/.dircolors`
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


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

case $_OS_ in
linux-gnu) linux_alias
           ;;
openbsd)   openbsd_alias
           ;;
esac

alias ll="ls -l"

alias vi="vim"
alias psaxuw="ps axuw"

alias an="locate -e -i -d $HOME/ani.db:$HOME/ani_local.db"
alias andb="updatedb -l 0 -o $HOME/ani.db -U /media/HD-PCU2/animu"
alias anldb="updatedb -l 0 -o $HOME/ani_local.db -U /media/data/Anime"

alias hglog="hg log | less"
alias gi="git"
alias gt="git"
alias curl="curl -k"
alias sudo="sudo "

