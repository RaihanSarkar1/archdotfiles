#!/bin/bash

# Debugging: Print environment variables
echo "BLOCK_BUTTON: $BLOCK_BUTTON" > /tmp/i3blocks-volume-debug.log

# Custom volume control script for i3blocks using wpctl (PipeWire)
case $BLOCK_BUTTON in
    4) wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ ;;  # Scroll up: increase volume
    5) wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- ;;  # Scroll down: decrease volume
    1) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;; # Left click: toggle mute
esac

# Get the current volume level and mute status
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")

# Debugging: Print volume and mute status
echo "VOLUME: $VOLUME" >> /tmp/i3blocks-volume-debug.log
echo "MUTE: $MUTE" >> /tmp/i3blocks-volume-debug.log

# Display the volume level
if [ "$MUTE" = "MUTED" ]; then
    echo " $VOLUME%"
else
    echo "󰕾 $VOLUME%"
fi
