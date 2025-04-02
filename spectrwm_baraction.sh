#!/bin/sh

if xrandr | grep "HDMI1 connected"; then
	xrandr --output HDMI1 --auto --left-of LVDS1 &
fi

picom -f &

feh --bg-fill --randomize /home/rene/Images/* & 

while true
do
        vol=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
        time=$(date + "%A %d/%B/%Y %R")
        temp="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
        net=$(iwconfig wlp9s0 | grep ESSID | awk '{print $4}')

        echo "$net | Temp: $temp | Vol: $vol"
        
        sleep 1m
done &
