#!/bin/sh

amixer set Master toggle
if amixer get Master | grep -q '\[off\]'; then
	brightnessctl -d platform::mute set 1
else
	brightnessctl -d platform::mute set 0
fi
