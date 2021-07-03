#!/bin/bash
## yad simple system tray right click menu ##
## menu file example in plain text file name!command ##
#Terminal!urxvt
#Paint!mtpaint

## Application menu file ###############################################

GET_MENU="$@"

########################################################################

function START_MENU () {

## MENU items ##########################################################

MENU_ITEMS="` cat "$GET_MENU" | tr '\n' '|' | sed '$s/.$//' `"

## Defaults ############################################################

TRAY_ICON="/usr/share/icons/hicolor/24x24/apps/yad.png"
POPUP_TEXT="system tray menu"
PIPE_FIFO=$(mktemp -u /tmp/menutray.XXXXXXXX)

## Action on left mouse click ###########################################
  function LEFT_CLICK () {
	exec 3<> $PIPE_FIFO
    echo "quit" >&3
    rm -f $PIPE_FIFO
}
  
  export -f LEFT_CLICK
  export PIPE_FIFO

## 1 Create PIPE_FIFO file #############################################
  mkfifo $PIPE_FIFO

## 2 Attach a filedescriptor to this PIPE_FIFO #########################
  exec 3<> $PIPE_FIFO
 
## 3 Run yad and tell it to read its stdin from the file descriptor ####
GUI=$(yad --notification --kill-parent --listen \
--image="$TRAY_ICON" \
--text="$POPUP_TEXT" \
--command="bash -c LEFT_CLICK" <&3 ) & 

## 4 Write menu to file descriptor to generate MENU ####################
 echo "menu:$MENU_ITEMS" >&3
}

## Check if menu file is provided ######################################
 
  if [ -z "$GET_MENU" ]; then 
  echo "traymenu usage: $0 /path/to/menu/file" && exit
  else
  START_MENU
  fi

######################################################################## 
