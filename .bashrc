. "$HOME/prompt.bash"

export PAGER="less"

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

alias an="locate -e -i -d $HOME/ani.db:$HOME/ani_local.db"
alias andb="updatedb -l 0 -o $HOME/ani.db -U /media/HD-PCU2/animu"
alias anldb="updatedb -l 0 -o $HOME/ani_local.db -U /media/data/Anime"

alias hglog="hg root >/dev/null 2>/dev/null && hg log | less"

if [[ -x /usr/bin/dircolors ]]; then
    eval `dircolors $HOME/.dircolors`
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
