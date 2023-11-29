#!/bin/bash
USER_NAME=$(who | awk -v vt=tty$(fgconsole) '$0 ~ vt {print $1}')
USER_ID=$(id -u "$USER_NAME")
PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"

sleep 2

sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile bluez_card.08_C8_C2_66_16_B0 handsfree_head_unit
logger "Switched Jabra to HSP profile"
