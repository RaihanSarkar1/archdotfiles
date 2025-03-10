#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait for the processes to close
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar main &

echo "Polybar launched..."
