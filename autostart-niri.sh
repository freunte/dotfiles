#! /bin/sh

swaybg -i $(find ~/Images/* -type f | shuf -n1) &

gammastep-indicator &

waybar -c /home/rene/.config/niri/config.jsonc &

