#!/bin/bash

if [ $# -ne 2 ]; then
  echo "USAGE:
  $(basename $0) <csv file> <device tag>
  "
  exit 1
fi

FILE=$1
DEVICE_TAG=$2

sed --in-place '/^.*,'$DEVICE_TAG'$/d' $FILE


