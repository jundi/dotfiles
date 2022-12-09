#!/bin/bash
if [[ `notify-send --version` == 'notify-send 0.7.9' ]]; then
	notify-send -t 2000 "clipboard: `wl-paste`"
	notify-send -t 2000 "primary: `wl-paste -p`"
else
	notify-send -t 2000 -a "clipboard" "`wl-paste`" -r 1145867
	notify-send -t 2000 -a "primary" "`wl-paste -p`" -r 9675876
fi
