#!/usr/bin/bash

cd ~/.config/i3/
N_SCREENS=$(xrandr --current | grep -o "\bconnected" | wc -l)
if [ $N_SCREENS -eq 1 ]; then
    # Monitor not connected - disable now.
    sed -i 's/set $monitor "DP-1"/set $monitor $builtindisp/' ~/.config/i3/config
    sed -i 's/exec_always xrandr.*/exec_always xrandr --output HDMI-1-1 --off --output eDP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-0 --off --output DP-1-1 --off --output DP-0 --off/' ~/.config/i3/config
else
    # Monitor detected - enable.
    sed -i 's/set $monitor $builtindisp/set $monitor "DP-1"/' ~/.config/i3/config
    sed -i 's/exec_always xrandr.*/exec_always xrandr --output HDMI-1-1 --off --output eDP-1-1 --mode 1920x1080 --pos 1920x112 --rotate normal --output DP-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-0 --off --output DP-1-1 --off --output DP-0 --off/' ~/.config/i3/config
fi
