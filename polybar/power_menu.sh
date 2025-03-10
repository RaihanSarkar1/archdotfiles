#!/bin/bash

options="Shutdown\nReboot\nLogout"

choice=$(echo -e "$options" | dmenu -p "Power:")

case "$choice" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        i3-msg exit # Or your window manager's logout command
        ;;
esac
