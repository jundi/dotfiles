#!/bin/bash

# old default sink
default_sink=$(pacmd list-sinks | grep "\*"  | awk '{print $3}')

echo $default_sink
i=0
for s in $(pacmd list-sinks | grep index | cut -d ":" -f 2); do

	# is this default sink?
	if [[ $s == $default_sink ]] ; then
		default_sink_ndx=$i
	fi

	# save sink index
	sink[$i]=$(echo $s | cut -d ":" -f 2)

	let i=$i+1
done
numsinks=$i
echo $numsinks

# index of new default sink
let default_sink_ndx=$default_sink_ndx+1
if [[ $default_sink_ndx -ge $numsinks ]]; then
  default_sink_ndx=0
fi

default_sink=${sink[$default_sink_ndx]}
echo $default_sink

# set new default sink
pacmd set-default-sink $default_sink

# move alls inputs to new default sink
pacmd list-sink-inputs | grep index |awk '{print $2}' | while read input; do
  pacmd move-sink-input $input $default_sink
done

# name of new default sink
let linenum=$default_sink_ndx+1
sinkname=$(pacmd list-sinks | grep device.description | head -n $linenum | tail -n 1 | cut -f 2 -d \" )

# print sink name
echo $sinkname | dzen2 -fn 'Bitstream Vera Sans-30:Bold' -p 2 -y 520
