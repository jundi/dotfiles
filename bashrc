#!/bin/bash


# Command prompt colors
str2int(){
 echo $1 | sha1sum | sed 's/[^0-9]*//g' | cut -c1-6 | xargs -I{} expr {} % $2 + 1
}
USERCOLOR=$(str2int `whoami` 229)
HOSTCOLOR=$(str2int `hostname | cut -d . -f1 | cut -d - -f1` 229)

# Command prompt
PS1="\[\e[1;38;5;${USERCOLOR}m\]\u\[\e[1;38;5;${HOSTCOLOR}m\]@\h:\w$\[\e[0m\] "


# completion
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi
if [[ -t 1 ]]; then
    bind '"\e[Z": menu-complete'            # shift-tab
    bind '"\e\e[Z": menu-complete-backward' # alt-shift-tab
    bind 'set show-all-if-ambiguous on'
    bind 'set page-completions off'
fi


# line wrap when terminal is resized
shopt -s checkwinsize


# environment variables
if [[ $(command -v urxvt) ]]; then
    export TERMINAL=urxvt
fi
if [[ $(command -v termite) ]]; then
    export TERMINAL=termite
fi
if [[ $(command -v vim) ]]; then
    export EDITOR=vim
    alias vimdiff='vim -d'
fi
if [[ $(command -v nvim) ]]; then
    export MANPAGER="nvim -c 'set ft=man' -"
    alias vimdiff='nvim -d'
    export EDITOR=nvim
fi
if [[ $(command -v vimpager) ]]; then
    export PAGER="vimpager"
fi
if [[ $(command -v waterfox) ]]; then
    export BROWSER=waterfox
elif [[ $(command -v firefox) ]]; then
    export BROWSER=firefox
fi
export SYSTEMD_PAGER=''


# alias
if [[ $(command -v exa) ]]; then
    alias ls='exa --color=auto --time-style=long-iso'
else
    alias ls='ls --color=auto --time-style="+%F %H:%M"'
fi
alias duh='du -h --max-depth=1 | sort -h'


# functions
function pwf() { file=$(ls $1) && echo $(pwd)/$file; }


# Set terminal title
case $TERM in
    xterm*|vte*|rxvt*)
	PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
	;;
    screen*)
	PROMPT_COMMAND='printf "\033k%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
	;;
esac

# vim: set sw=4:
