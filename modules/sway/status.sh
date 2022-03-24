#!/bin/sh

#$(awk '/^Mem/ {print $3}' <(free -h))
echo "$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)  $(cat /sys/class/power_supply/BAT0/capacity)%  $(date +'%Y-%m-%d %H:%M:%S')"
