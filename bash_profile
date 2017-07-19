#!/bin/bash

# global bash_profile
if [[ -f ~/etc/profile ]]; then
    source /etc/profile
fi

# PATH
export PATH=~/.opt/bin:~/.local/bin:$PATH

# bashrc
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

# vim: set sw=4:
