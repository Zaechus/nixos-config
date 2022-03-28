#!/bin/sh

[[ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]] && \
    cpugov="$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)  "

[[ -f /sys/class/power_supply/BAT0/capacity ]] && \
    battery="$(cat /sys/class/power_supply/BAT0/capacity | tr -d \\n)%  "

echo "$cpugov$battery$(date +'%Y-%m-%d %H:%M:%S')"
