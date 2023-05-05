#!/bin/bash

# Set initial cursor position to the center of the screen
xdotool mousemove $(xdpyinfo | grep dimensions | awk '{print $2}' | tr 'x' ' '/2)

# Set amplitude and frequency of vibration
amp=1.2   # in pixels
freq=100 # in Hz

# Calculate period of vibration
period=$(echo "scale=2; 1/$freq" | bc)

# Initialize angle and time variables
angle=0
t=0

# Start infinite loop to vibrate cursor
while true; do
    # Calculate x and y coordinates based on current angle and time
    x=$(echo "$amp * s($angle) * (1 - e(-$t/$period))" | bc -l)
    y=$(echo "$amp * c($angle) * (1 - e(-$t/$period))" | bc -l)
    
    # Move cursor to new position
    xdotool mousemove_relative --sync $x $y
    
    # Update angle and time
    angle=$(echo "$angle + 0.1" | bc -l)
    if (( $(echo "$angle >= 360" | bc -l) )); then
        angle=$(echo "$angle - 360" | bc -l)
    fi
    t=$(echo "$t + 0.01" | bc -l)
    
    # Sleep for a short time to avoid using too much CPU
    # sleep 0.00000001
done
