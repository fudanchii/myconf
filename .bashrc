. "$HOME/prompt.bash"

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

alias vi="vim"
alias ls="ls --color"
alias grep="grep --color"
alias psaxuw="ps axuw"

alias an="locate -e -i -d $HOME/ani.db:$HOME/ani_local.db"
alias andb="updatedb -l 0 -o $HOME/ani.db -U /media/HD-PCU2/animu"
alias anldb="updatedb -l 0 -o $HOME/ani_local.db -U /media/data/Anime"

alias hglog="hg log | less"
alias gi="git"
alias gt="git"

if [[ -x /usr/bin/dircolors ]]; then
    [[ -f $HOME/.dircolors ]] && eval `dircolors $HOME/.dircolors`
fi

if [[ -x `which grc 2> /dev/null` ]]; then
    alias colourify="grc --colour=auto"
    alias configure="colourify ./configure"
    alias diff="colourify diff"
    alias make="colourify make"
    alias gcc="colourify gcc"
    alias g++="colourify g++"
    alias as="colourify as"
    alias gas="colourify gas"
    alias ld="colourify ld"
    alias netstat="colourify netstat"
    alias ping="colourify ping"
    alias traceroute="colourify /usr/sbin/traceroute"
    alias tail="grc tail"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
