#!/bin/bash

device=/dev/ttyACM0

if [ ! -w $device ] ; then
  echo "tty not attached at " $device
  exit 1
fi

echo -n -e "\xFE\x58" > $device
exit $?
