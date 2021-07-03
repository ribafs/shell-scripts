yadb=0
while [ $yadb -eq "0" ];do 
    fc=$(basename -s .sh $(find . -name "*.sh") |yad --list --width=500 --height=500 --center --column="File" --separator="")
    yadb=$?
    if [ $yadb -eq "0" ]; then 
       cat $fc.sh |yad --text-info --width=800 --height=300
    fi
    # If you press cancel on yad window , then yadb will become 1 , file will not be displayed and while loop will be ended.
done
