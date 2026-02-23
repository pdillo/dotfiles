#!/usr/bin/env bash

polybar-msg cmd quit

# Laptop Bar (Always launch)
echo "--- Launching Laptop Polybar (eDP-1) ---"
polybar pdillo-polybar -c "$HOME/.config/polybar/config.ini" & disown

# Check if the external monitor is connected (HDMI-2)
if xrandr | grep "HDMI-2 connected" ; then
    echo "--- Launching External Polybar (HDMI-2) ---"
    # Launch the new bar configuration
    polybar external-polybar -c "$HOME/.config/polybar/config.ini" & disown
else
    echo "External monitor (HDMI-2) not connected. Only launching laptop bar."
fi

xwallpaper --zoom $HOME/Pictures/Wallpapers/$WAL

echo "Gogo polybar..."
