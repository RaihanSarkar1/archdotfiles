# archdotfiles
The dot files to my arch linux customization

I am using the i3 wm primarily and a sway wm is also installed for backup.
I have alacritty as the terminal
Picom as the compositor
Polybar as the status bar
Mpv as the default player
Thunar as the file browser

Waybar and Wofi for Sway WM

Most effective tear fix for my Intel chip is as follows
the following was written in /etc/X11/xorg/conf.d/10-intel.conf
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "TearFree" "true"
    Option "DRI" "2"
    Option "AccelMethod" "sna" #default
    Option "AccelMethod" "uxa" #fallback if failed
EndSection


