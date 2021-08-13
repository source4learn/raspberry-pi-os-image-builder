if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]
then
startx >/dev/null 2>&1
fi
