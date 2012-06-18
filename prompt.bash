#!/usr/bin/env bash

prompt_char () {
    [[ -d ".git" ]] && echo '+' && return
    [[ -d ".hg" ]] && echo '&' && return
    [[ $UID -eq 0 ]] && echo '#' && return
    echo '$'
}

vcs_mod () {
    hgmod=""
    if [[ `hg status 2>/dev/null | wc -l` -ne "0" ]]; then
        hgmod="*"
    elif [[ `git status 2>/dev/null | wc -l` -gt 4 ]]; then
        hgmod="*"
    fi
    echo "$hgmod"
}

vcs_prompt_info () {
    if [[ `hg bookmark 2>/dev/null` == "no bookmarks set" ]]; then
        hg bookmark master
    fi 
    hgstatus="$(hg bookmark 2>/dev/null | grep "*" | cut -d " " -f 3)"
    [[ -d ".hg" ]] && hgstatus="$hgstatus@`hg branch`"
    [[ -d ".git" ]] && hgstatus="$(git branch | grep "*" | cut -d " " -f 2)"
    echo $hgstatus
}

PS1="\[\033[0;31m\]\$(vcs_mod)\[\033[00;32m\]\$(vcs_prompt_info)\[\033[00m\]:\[\033[00;34m\]\W \[\033[00;35m\]\$(prompt_char)\[\033[00m\] "

