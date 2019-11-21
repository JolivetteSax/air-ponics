#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Supply RGB values as Hex arguments"
  echo "Example: ./color.sh FF FF FF"
  exit 1
fi

device=/dev/ttyACM0

if [ ! -w $device ] ; then
  echo "tty not attached at " $device
  exit 2
fi

echo -n -e "\xFE\xD0\x$1\x$2\x$3" > $device
