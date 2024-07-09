#!/bin/sh

#net=$(iwconfig wlan0 | grep ESSID | awk '{print $4}')
#echo $net
STATUS=$(cat /sys/class/net/wlp8s0/operstate)
echo NetStatus: $STATUS
