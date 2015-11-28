#!/bin/sh
#WARN: should match the active terminal profile: /home/adrian/.gconf/apps/gnome-terminal/profiles
gconftool-2 --set "/apps/gnome-terminal/profiles/Profile0/cursor_shape" --type string "$1"
