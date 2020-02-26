#!/bin/bash


# Command prompt colors
str2int(){
 echo $1 | sha1sum | sed 's/[^0-9]*//g' | cut -c1-6 | xargs -I{} expr {} % $2 + 1
}
USERCOLOR=$(str2int `whoami` 229)
HOSTCOLOR=$(str2int `hostname | cut -d . -f1 | cut -d - -f1` 229)

# Command prompt
PS1="\[\e[1;38;5;${USERCOLOR}m\]\u\[\e[1;38;5;${HOSTCOLOR}m\]@\h:\w$\[\e[0m\] "

# ls colors
if [[ -f ~/dircolors ]]; then
    eval $( dircolors -b ~/.dircolors )
elif [[ -f /usr/share/LS_COLORS/dircolors.sh ]]; then
    source /usr/share/LS_COLORS/dircolors.sh
fi

# completion
if [[ -t 1 ]]; then
    bind '"\e[Z": menu-complete'             # shift-tab
    bind '"\e[1;2P": menu-complete-backward' # shift-F1
    bind 'set show-all-if-ambiguous on'
    bind 'set page-completions off'
fi


# line wrap when terminal is resized
shopt -s checkwinsize


# environment variables
if [[ $(command -v gnome-terminal) ]]; then
    export TERMINAL=gnome-terminal
fi
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
if [[ $(command -v firefox) ]]; then
    export BROWSER=firefox
fi
export SYSTEMD_PAGER=''
export ANSIBLE_STDOUT_CALLBACK=debug


# alias
alias ls='ls --color=auto --time-style="+%F %H:%M"'
alias duh='du -h --max-depth=1 | sort -h'
alias PluginInstall="vim +PluginClean +PluginInstall +qall"
alias venv='source ~/.opt/scripts/venv.sh'
alias whatismyip='curl https://api.ipify.org'
alias wrap="tput rmam; fc -s;tput smam"
alias vam='ansible-vault edit'
alias ms='md5sum'


# functions
function pwf() { file=$(ls "$1") && echo $(pwd)/$file; }
function findn() { find -name "*$1*";}


# keybindings
if [[ -t 1 ]]; then
    bind '"\e,": "cd ..\n"' # alt-,
fi

# Set terminal title
case $TERM in
    xterm*|vte*|rxvt*)
        PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
    screen*)
        PROMPT_COMMAND='printf "\033k%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
esac

# Current directory for termite
if [[ $TERM == xterm-termite ]] && [[ -f /etc/profile.d/vte.sh ]]; then
  . /etc/profile.d/vte.sh
fi

# vim: set sw=4:
