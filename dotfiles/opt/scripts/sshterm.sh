#!/bin/bash

title=$(swaymsg -t get_tree | jq  '..|try select(.focused == true)|.name' | cut -d "\"" -f 2)
server=$(echo $title | cut -d @ -f 2 | cut -d : -f 1)
path=$(echo $title | cut -d : -f 2)
user=$(echo $title | cut -d @ -f 1)

# override 'server' if argument is provided
if [[ $# -gt 0 ]]; then
	server=$1
fi

if [[ $server == $(hostname -s) || $server == "localhost" ]]; then
	fullpath=$(echo $path | sed "s/~/\/home\/$(whoami)/")
	alacritty --working-directory $fullpath
else
	alacritty --hold -e "ssh $server -t \"export TERM=xterm-256color; cd $path; bash --login\""
fi
