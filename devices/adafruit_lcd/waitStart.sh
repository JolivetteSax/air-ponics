#!/bin/bash

device=/dev/ttyACM0
echo "waiting for device file $device"
exists=false

until $exists 
do
  if [ -e $device ] ; then
    exists=true
  else 
    sleep 1
  fi
done

echo "Device connected."
sleep .5

if [ ! -w $device ] ; then 
  echo "not writable, are you in dialout or pertinent group?"
  exit 1
fi

echo "Permissions established."
sleep .5

echo "Checking device ready to receieve..."
error=1
until [[ $error == 0 ]] 
do
  sleep 1
  result=`./clear.sh 2>/dev/null`
  error=$?
done

echo "Screen cleared."
sleep .5

./reset.sh
./brightness.sh FF
./text.sh "Ready."
sleep 2

./reset.sh
./time.sh

echo "done."
