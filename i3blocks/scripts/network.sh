#!/bin/bash

# Ethernet status script for i3blocks

# Get the Ethernet interface name
INTERFACE=$(ip link | grep -oP 'enp\w+s\d+|eth\d+' | head -n 1)

# Check if Ethernet is connected
if [ -z "$INTERFACE" ]; then
    echo " No Ethernet"
    echo " No Ethernet"
    echo "#FF0000"  # Red color for no connection
    exit 0
fi

# Handle click actions
case $BLOCK_BUTTON in
    1) nm-connection-editor ;;  # Left-click: Open NetworkManager GUI
    2) nmcli dev connect "$INTERFACE" ;;  # Middle-click: Reconnect Ethernet
    3) nmcli dev disconnect "$INTERFACE" ;;  # Right-click: Disconnect Ethernet
esac

# Get connection status
STATUS=$(nmcli -t -f DEVICE,STATE dev status | grep "^$INTERFACE:" | cut -d: -f2)

# Get IP address
IP=$(ip -4 addr show dev "$INTERFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Get connection speed (requires ethtool)
SPEED=$(ethtool "$INTERFACE" 2>/dev/null | grep -oP 'Speed: \K[\dGMbps]+')

# Display the status
case $STATUS in
    connected)
        if [ -n "$IP" ]; then
            echo " $IP"
            echo " $IP"
            echo "#A4FF67"  # Green color for connected
        else
            echo " No IP"
            echo " No IP"
            echo "#FFA500"  # Orange color for no IP
        fi
        ;;
    disconnected)
        echo " Disconnected"
        echo " Disconnected"
        echo "#FF0000"  # Red color for disconnected
        ;;
    *)
        echo " Unknown"
        echo " Unknown"
        echo "#FF0000"  # Red color for unknown status
        ;;
esac

# Optional: Display connection speed
if [ -n "$SPEED" ]; then
    echo " $SPEED"
fi
