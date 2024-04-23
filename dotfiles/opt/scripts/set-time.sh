echo 'Enter current time in format 2012-10-30 18:17:16'
read time
timedatectl set-ntp false
timedatectl set-time "$time"
timedatectl set-ntp true
killall waybar
waybar & disown
