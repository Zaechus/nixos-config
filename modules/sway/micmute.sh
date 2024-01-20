#!/bin/sh

amixer set Capture toggle; if amixer get Capture | grep -q '\[off\]' ; then brightnessctl -d platform::micmute set 1; else brightnessctl -d platform::micmute set 0; fi 
