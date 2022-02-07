#!/bin/bash
notify-send -t 2000 "clipboard" "`xsel -bo`"
notify-send -t 2000 "primary" "`xsel -po`"
