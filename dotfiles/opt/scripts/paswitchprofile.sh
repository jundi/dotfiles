#!/bin/bash
set -e

profiles=(`pactl list cards | awk '{print $ 1}' | grep 'output:.*stereo+input' | cut -d : -f 1-3`)
last_profile=${profiles[-1]}

active_profile=`pactl list cards | grep "Active Profile" | awk '{print $3}'`
if [[ ! "${profiles[*]}" =~ "$active_profile" ]]; then
	# active profile is not on the list
	active_profile=$last_profile
fi

for profile in ${profiles[@]}; do
	if [[ $active_profile == $last_profile ]]; then
		# Last profile was the active profile. This profile is next one
		# on the list
		pactl set-card-profile 0 $profile
		notify-send --app-name $0 -t 3000 "Profile changed to $profile"
		exit 0
	fi
	last_profile=$profile
done

notify-send --app-name $0 -t 3000 "Error: profile not changed"
exit 1
