#!/bin/bash

# Function to rotate the screen
rotate_screen() {
    orientation=$1
    case "$orientation" in
        normal)
            hyprctl keyword monitor eDP-1,preferred,auto,1,transform,0
            hyprctl keyword input:touchdevice:transform 0
            ;;
        bottom-up)
            hyprctl keyword monitor eDP-1,preferred,auto,1,transform,2
            hyprctl keyword input:touchdevice:transform 2
            ;;
        right-up)
            hyprctl keyword monitor eDP-1,preferred,auto,1,transform,3
            hyprctl keyword input:touchdevice:transform 3
            ;;
        left-up)
            hyprctl keyword monitor eDP-1,preferred,auto,1,transform,1
            hyprctl keyword input:touchdevice:transform 1
            ;;
    esac
}

# Main loop
monitor-sensor | while read -r line
do
    if [[ $line == *"Accelerometer orientation changed:"* ]]; then
        orientation=$(echo $line | awk -F ': ' '{print $2}')
        rotate_screen $orientation
    fi
done
