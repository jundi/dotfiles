#!/bin/bash
set -e

if [[ -n `pactl get-default-sink | grep "analog-stereo"` ]]; then
	profile="hdmi-stereo"
else
	profile="analog-stereo"
fi

notify-send --app-name `basename $0` -r 18765 -t 3000 $profile
pactl set-card-profile 0 output:$profile
