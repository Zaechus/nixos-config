#!/bin/sh

echo "$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)  $(cat /sys/class/power_supply/BAT0/capacity | tr -d \\n && echo %)  $(date +'%Y-%m-%d %H:%M:%S')"
