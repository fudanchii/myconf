declare -ar _success_status=(
    [  0]=😀
    [  1]=😁
    [  2]=😂
    [  3]=🤣
    [  4]=😄
    [  5]=😆
    [  6]=😉
    [  7]=😊
    [  8]=😋
    [  9]=😎
    [ 10]=😍
    [ 11]=🙂
    [ 12]=🤗
    [ 13]=🤩
    [ 14]=😝
    [ 15]=🆗
    [ 16]=🆙
    [ 17]=🆒
)

declare -ar _error_status=(
    [ 0]=🤔
    [ 1]=🤨
    [ 2]=😐
    [ 3]=😑
    [ 4]=😶
    [ 5]=🙄
    [ 6]=😏
    [ 7]=😣
    [ 8]=😥
    [ 9]=😫
    [10]=😒
    [11]=😓
    [12]=😔
    [13]=😖
    [14]=😞
    [15]=😤
    [16]=😢
    [17]=😭
    [18]=😱
    [19]=🆖
)

declare -ar _int_status=(
    [0]=🤫
    [1]=🙃
    [2]=😷
    [3]=🧐
)

rnd() {
    arg=${1:-"10"}
    echo -n $(echo | awk "BEGIN{srand();} {print (int((rand() * 1000)) % $arg)}")
}

success_status() {
    echo ${_success_status[$(rnd 18)]}
}

error_status() {
    echo ${_error_status[$(rnd 20)]}
}

int_status() {
    echo ${_int_status[$(rnd 4)]}
}

ret_status() {
    declare -ar _status=(
        [  0]=$(success_status)
        [  1]=$(error_status)
        [129]=📞                # SIGHUP
        [130]=$(int_status)     # SIGINT
        [131]="(╯°□ °）╯︵ ┻━┻" # SIGQUIT
        [132]=👮                # SIGILL
        [133]=🐍                # SIGTRAP
        [134]=💥                # SIGABRT
        [135]=🚌                # SIGBUS
        [136]=🧮                # SIGFPE
        [137]=🔫                # SIGKILL
        [138]=🥇                # SIGUSR1
        [139]=💣                # SIGSEGV
        [140]=🥈                # SIGUSR2
        [141]=🚿                # SIGPIPE
        [142]=⏰                # SIGALRM
        [143]=💀                # SIGTERM
        [147]=💤                # SIGSTOP
        [148]=😴                # SIGTSTP
    )
    echo ${_status[$1]:-💩}
}

PS1='$(ret_status $?) \u\[\033[00;32m\]@\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[00;35m\]\$\[\033[00m\] '

set -o vi
bind -x '"\C-l":clear'

oii() {
    CMD=`history 2 | head -n 1 | sed 's/^[ ]*[0-9]*//'`
    echo "will run sudo $CMD"
    echo "press ctrl-c to cancel within 3 seconds..."
    sleep 3
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

export WORKON_HOME=~/Envs
export PAGER="less"
export EDITOR="vim"


[[ -d /opt/git/bin ]] && PATH=/opt/git/bin:$PATH

[[ -d $HOME/apps/node ]] && PATH=$HOME/apps/node/bin:$PATH
[[ -d $HOME/apps/rust ]] && PATH=$HOME/apps/rust/bin:$PATH
[[ -d $HOME/apps/python ]] && PATH=$HOME/apps/python/bin:$PATH

[[ -d $HOME/apps/go ]] && {
    PATH=$HOME/apps/go/bin:$PATH
    PATH=$HOME/go/bin:$PATH
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
