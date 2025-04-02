#!/bin/sh

vol=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
time=$(date +"%A %d/%B/%Y %R")
temp="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
title=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true).name')
    
echo -- $title -- Temp:$temp / Vol:$vol / Date:$time
