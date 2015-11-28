#!/bin/sh
gconftool-2 --set "/apps/gnome-terminal/profiles/Profile0/cursor_shape" --type string "$1"
