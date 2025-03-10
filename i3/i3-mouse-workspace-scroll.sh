#!/bin/bash

while true; do
    event=$(xinput test-xi2 --root | grep -E "BUTTON|AXIS")

    echo "Event: $event" # Add this line

    if [[ "$event" == *"button 4"* ]]; then
        i3-msg workspace next
    elif [[ "$event" == *"button 5"* ]]; then
        i3-msg workspace prev
    fi
done
