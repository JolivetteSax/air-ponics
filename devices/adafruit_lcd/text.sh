#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Supply a text argument as a string literal"
  exit 1
fi

device=/dev/ttyACM0

if [ ! -w $device ] ; then
  echo "tty not attached at " $device
  exit 2
fi

echo -n "$1" > $device
