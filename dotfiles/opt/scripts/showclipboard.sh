#!/bin/bash
notify-send -t 2000 "clipboard" "`wl-paste`"
notify-send -t 2000 "primary" "`wl-paste -p`"
