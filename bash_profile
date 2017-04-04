#!/bin/bash

# global bash_profile
if [[ -f ~/etc/profile ]]; then
    source /etc/profile
fi

# bashrc
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

# PATH
export PATH=~/.opt/bin:~/.local/bin:$PATH

# vim: set sw=4:
