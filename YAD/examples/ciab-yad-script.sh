#!/bin/bash

#====================================================================================================
# NOTE:  the following menu entries are for simple example.  You can change and/or add to them
#        whatever you need to do.   For instance you could create a Menu Entry (the first text before 
#        vertical bar/pipe symbol "|".   The "action" is what follows the vertical bar/pipe symbol
#        and that could be a command like I show below using "sudo apt-get install" or it could be
#        a Bash script, Python program etc.
#
#        To use this script you **must** install YAD on your system first.   On a Debian based system
#        like Ubuntu this is installed using:  $ sudo apt-get install yad

menu=( "Install VLC|sudo apt-get install vlc -y"
       "Install Kate|sudo apt-get install kate -y"
       "Some Addon pack|install_p3"
       "And More|some_stuff" )

yad_opts=( --form
           --title="Applications Installer - change to whatever you want"
           --text="Select Applications to Install"
           --image="/path/to/some/png/logo/image/logo.png"
           --button="Install" --button="Exit" )

for m in "${menu[@]}"
do
  yad_opts+=( --field="${m%|*}:CHK" )
done

IFS='|' read -ra ans < <( yad "${yad_opts[@]}" )

for i in "${!ans[@]}"
do
  if [[ ${ans[$i]} == TRUE ]]
  then
    m=${menu[$i]}
    name=${m%|*}
    cmd=${m#*|}
    echo "selected: $name ($cmd)"
    $cmd
  fi
done

exit 0
