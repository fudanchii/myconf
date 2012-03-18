. "$HOME/prompt.bash"
#PS1="\[\033[01;35m\]\u\[\033[00m\]@\[\033[01;37m\]\h
PS1="\[\033[0;31m\]\$(vcs_mod)\[\033[00m\]\$(vcs_prompt_info):\[\033[01;36m\]\W \[\033[01;35m\]\$(prompt_char)\[\033[00m\] "

if [ $UID -eq 0 ]; then
    PS1="@\[\033[01;37m\]\h:\[\033[01;36m\]\W \[\033[00m\]# "
fi

PATH=$PATH:/opt/clang/bin
PATH=/opt/node/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=/opt/qemu/bin:$PATH
PATH=/opt/deadbeef/bin:$PATH
export NODE_PATH=$HOME/node_modules:/opt/node/bin:/opt/node/lib/node_modules
export GOPATH=$HOME/linux-stub/go
export GOROOT=$GOPATH
PATH=$PATH:$GOROOT/bin
PATH=$HOME/android-sdk-linux_x86/platform-tools:$PATH

alias ls="ls --color"
alias grep="grep --color"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
