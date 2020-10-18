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

if [ -n "$SSH_TTY" ]; then
    PS1='\u\[\033[00;32m\]@\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[00;35m\]\$\[\033[00m\] '
else
    PS1='$(ret_status $?) \u\[\033[00;32m\]@\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[00;35m\]\$\[\033[00m\] '
fi

set -o vi
bind -x '"\C-l":clear'
shopt -s autocd

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

source ~/myconf/aliases

export WORKON_HOME=~/Envs
export PAGER="less"
export EDITOR="vim"

[[ -d /opt/git/bin ]] && PATH=/opt/git/bin:$PATH

[[ -d $HOME/apps/node ]] && PATH=$HOME/apps/node/bin:$PATH
[[ -d $HOME/apps/rust ]] && PATH=$HOME/apps/rust/bin:$PATH
[[ -d $HOME/apps/python ]] && PATH=$HOME/apps/python/bin:$PATH
[[ -d $HOME/apps/crystal ]] && PATH=$HOME/apps/crystal/bin:$PATH
[[ -d $HOME/apps/racket ]] && PATH=$HOME/apps/racket/bin:$PATH

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

export DENO_INSTALL="/home/adie/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export GUILE_LOAD_PATH=$HOME/repo/scheme-bytestructures:$GUILE_LOAD_PATH

# fnm
export PATH=/home/adie/.fnm:$PATH
eval "`fnm env --multi`"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="/home/adie/fuchsia/.jiri_root/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
