#!/bin/sh

STATUS=$(cat /sys/class/net/wlp8s0/operstate)
echo NetStatus: $STATUS
