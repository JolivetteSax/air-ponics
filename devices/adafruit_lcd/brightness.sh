#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Supply brightness as Hex argument between 00 - FF"
  exit 1
fi

device=/dev/ttyACM0

if [ ! -w $device ] ; then
  echo "tty not attached at " $device
  exit 2
fi

echo -n -e "\xFE\x99\x$1" > $device
