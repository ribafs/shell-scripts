#!/bin/bash

PIPE="$HOME/.pipe.tmp"
rm          $PIPE
mkfifo      $PIPE
exec 3<>    $PIPE

yad --notification --listen <&3 &
echo "menu:\
Terminal Emulator	! gnome-terminal |\
File Manager		! nemo |\
Web Browser		! firefox |\
Mousepad		! mousepad | " >&3
echo "icon:$HOME/.icons/menu.png" >&3
echo "tooltip: Right-click for menu" >&3


exit 0
