#!/usr/bin/env bash
A_1080=400
B_1080=400

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Get the resolution and scale of the focused monitor
# resolution=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true) | .current_mode.height / .scale' | awk -F'.' '{print $1}')
# sway_scale=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true) | .scale')

# Calculate the top and bottom bar thickness based on 1200 height reference
# top_bar_thickness=$(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $sway_scale / $resolution}")
# bottom_bar_thickness=$(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $sway_scale / $resolution}")
# this is built in for 1200px height screen to take up 1/4 of space
top_bar_thickness=300
bottom_bar_thickness=300

# Run wlogout with the calculated values
wlogout -C $HOME/.config/wlogout/style.css -l $HOME/.config/wlogout/layout --protocol layer-shell -b 5 -T $top_bar_thickness -B $bottom_bar_thickness -s &
