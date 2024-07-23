#!/bin/bash

# Get the current keyboard layout using swaymsg
layout=$(swaymsg -t get_inputs | jq -r '.[] | select(.type == "keyboard") | .xkb_active_layout_name')

# Print the layout
echo " $layout"
